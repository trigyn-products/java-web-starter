package com.trigyn.jws.usermanagement.security.config.oauth;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.trigyn.jws.usermanagement.entities.JwsUser;
import com.trigyn.jws.usermanagement.exception.OAuth2AuthenticationProcessingException;
import com.trigyn.jws.usermanagement.repository.JwsUserRepository;
import com.trigyn.jws.usermanagement.repository.UserManagementDAO;
import com.trigyn.jws.usermanagement.security.config.UserInformation;
import com.trigyn.jws.usermanagement.utils.Constants;

@Service
public class CustomOidcUserService  extends OidcUserService{

	@Autowired
	private JwsUserRepository jwsUserRepository = null;
	
	@Autowired
	private UserManagementDAO userManagementDAO = null;
	
	
	@Override
	public OidcUser loadUser(OidcUserRequest userRequest) throws OAuth2AuthenticationException {
		// TODO Auto-generated method stub
		
			OidcUser oidcUser =	super.loadUser(userRequest);
				try {
		            return processOAuth2User(userRequest, oidcUser);
		        } catch (AuthenticationException ex) {
		            throw ex;
		        } catch (Exception ex) {
		            // Throwing an instance of AuthenticationException will trigger the OAuth2AuthenticationFailureHandler
		            throw new InternalAuthenticationServiceException(ex.getMessage(), ex.getCause());
		        }
		    }

			
			
			private OidcUser processOAuth2User(OAuth2UserRequest userRequest, OidcUser oidcUser) {
				
				OAuth2UserInfo oAuth2UserInfo = OAuth2UserInfoFactory.getOAuth2UserInfo(userRequest.getClientRegistration().getRegistrationId(), oidcUser.getAttributes());
				
				if(StringUtils.isEmpty(oAuth2UserInfo.getEmail())) {
		            throw new OAuth2AuthenticationProcessingException("Email not found from OAuth2 provider");
		        }

		        JwsUser user = jwsUserRepository.findByEmailIgnoreCase(oAuth2UserInfo.getEmail());
		        if(user != null) {
//		            if(!user.getProvider().equals(AuthProvider.valueOf(oAuth2UserRequest.getClientRegistration().getRegistrationId()))) {
//		                throw new OAuth2AuthenticationProcessingException("Looks like you're signed up with " +
//		                        user.getProvider() + " account. Please use your " + user.getProvider() +
//		                        " account to login.");
//		            }
		        	if(user.getIsActive() == Constants.INACTIVE) {
		        		throw new OAuth2AuthenticationProcessingException("Access Denied Please contact admin");
		        	}
		            user = updateExistingUser(user, oAuth2UserInfo);
		        } else {
		            user = registerNewUser(userRequest, oAuth2UserInfo);
		        }

		        return new UserInformation().create(user, oidcUser.getAttributes());
		    }

			private JwsUser registerNewUser(OAuth2UserRequest oAuth2UserRequest, OAuth2UserInfo oAuth2UserInfo) {
				JwsUser user = new JwsUser();

		       // user.setProvider(AuthProvider.valueOf(oAuth2UserRequest.getClientRegistration().getRegistrationId()));
		        //user.setProviderId(oAuth2UserInfo.getId());
		        user.setFirstName(oAuth2UserInfo.getName().split(" ")[0]);
		        user.setLastName(oAuth2UserInfo.getName().split(" ")[1]);
		        user.setEmail(oAuth2UserInfo.getEmail());
		        user.setIsActive(Constants.ISACTIVE);
		        user.setForcePasswordChange(Constants.INACTIVE);
		        //user.setImageUrl(oAuth2UserInfo.getImageUrl());
		        userManagementDAO.saveUserData(user);
		        userManagementDAO.saveAuthenticatedRole(user.getUserId());
		        
		        return user;
		    }

		    private JwsUser updateExistingUser(JwsUser existingUser, OAuth2UserInfo oAuth2UserInfo) {
		        existingUser.setFirstName(oAuth2UserInfo.getName().split(" ")[0]);
		        existingUser.setLastName(oAuth2UserInfo.getName().split(" ")[1]);
		        //existingUser.setImageUrl(oAuth2UserInfo.getImageUrl());
		        return jwsUserRepository.save(existingUser);
		    }
	
}
