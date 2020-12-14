package com.trigyn.jws.dashboard.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "dashlet")
public class Dashlet implements Serializable {

	
	private static final long			serialVersionUID		= 1L;

	@Id
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.trigyn.jws.dbutils.configurations.CustomUUIDGenerator")
	@Column(name = "dashlet_id", nullable = false)
	private String						dashletId				= null;

	@Column(name = "dashlet_name")
	private String						dashletName				= null;

	@Column(name = "dashlet_title")
	private String						dashletTitle			= null;

	@Column(name = "x_coordinate")
	private Integer						xCoordinate				= null;

	@Column(name = "y_coordinate")
	private Integer						yCoordinate				= null;
	
	@Column(name = "dashlet_width")
	private Integer						width					= null;

	@Column(name = "dashlet_height")
	private Integer						height					= null;
	
	@Column(name = "context_id", nullable = false)
	private String						contextId				= null;
	
	@Column(name = "show_header", nullable = false)
	private Integer						showHeader				= 1;
	
	@Column(name = "dashlet_query")
	private String						dashletQuery			= null;
	
	@Column(name = "dashlet_body")
	private String						dashletBody				= null;

	@Column(name = "created_by")
	private String						createdBy				= null;

	@JsonIgnore
	@Column(name = "created_date")
	private Date						createdDate				= null;

	@Column(name = "updated_by")
	private String						updatedBy				= null;

	@JsonIgnore
	@Column(name = "updated_date")
	private Date						updatedDate				= null;
	
	@Column(name = "is_active")
	private Integer						isActive				= null;
	
	@Column(name = "dashlet_query_checksum")
	private String				dashletQueryChecksum			= null;
	
	@Column(name = "dashlet_body_checksum")
	private String				dashletBodyChecksum				= null;
	
	@Column(name = "dashlet_type_id")
	private Integer						dashletTypeId			= 1;

	@OneToMany(mappedBy = "dashlet", fetch = FetchType.EAGER)
	private List<DashletProperties>				properties				= new ArrayList<>();

	@OneToMany(mappedBy = "dashlet", fetch = FetchType.LAZY)
	private List<DashletRoleAssociation>		roleAssociation			= new ArrayList<>();

	@OneToMany(mappedBy = "dashlet", fetch = FetchType.LAZY)
	private List<DashboardDashletAssociation>	dashboardAssociation	= new ArrayList<>();
	
	@OneToMany(mappedBy = "dashlet", fetch = FetchType.LAZY)
	private List<DashletRoleAssociation> dashletRoleAssociations		= new ArrayList<>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "context_id", referencedColumnName = "context_id", nullable = false, insertable = false, updatable = false)
	private ContextMaster				contextMaster					= null;


	public Dashlet() {
	}


	public Dashlet(String dashletId, String dashletName, String dashletTitle, Integer xCoordinate, Integer yCoordinate, Integer width, Integer height, String contextId, Integer showHeader, String dashletQuery, String dashletBody,
	        String createdBy, Date createdDate, String updatedBy, Date updatedDate, Integer isActive, List<DashletProperties> properties, List<DashletRoleAssociation> roleAssociation, List<DashboardDashletAssociation> dashboardAssociation,
	        ContextMaster contextMaster, String dashletQueryChecksum, String dashletBodyChecksum, Integer dashletTypeId) {
		this.dashletId 					= dashletId;
		this.dashletName 				= dashletName;
		this.dashletTitle 				= dashletTitle;
		this.xCoordinate 				= xCoordinate;
		this.yCoordinate 				= yCoordinate;
		this.width 						= width;
		this.height 					= height;
		this.contextId 					= contextId;
		this.showHeader 				= showHeader;
		this.dashletQuery 				= dashletQuery;
		this.dashletBody 				= dashletBody;
		this.createdBy 					= createdBy;
		this.createdDate 				= createdDate;
		this.updatedBy 					= updatedBy;
		this.updatedDate 				= updatedDate;
		this.isActive 					= isActive;
		this.properties 				= properties;
		this.roleAssociation 			= roleAssociation;
		this.dashboardAssociation 		= dashboardAssociation;
		this.contextMaster 				= contextMaster;
		this.dashletQueryChecksum       = dashletQueryChecksum;
		this.dashletBodyChecksum 		= dashletBodyChecksum;
		this.dashletTypeId 				= dashletTypeId;
	}


	public Dashlet(String dashletId, String dashletName, String dashletTitle, Integer xCoordinate, Integer yCoordinate, Integer width, Integer height, String contextId, Integer showHeader, String dashletQuery, String dashletBody,
	        String createdBy, Date createdDate, String updatedBy, Date updatedDate, Integer isActive, String dashletQueryChecksum,String dashletBodyChecksum) {
		this.dashletId 					= dashletId;
		this.dashletName 				= dashletName;
		this.dashletTitle 				= dashletTitle;
		this.xCoordinate 				= xCoordinate;
		this.yCoordinate 				= yCoordinate;
		this.width 						= width;
		this.height 					= height;
		this.contextId 					= contextId;
		this.showHeader 				= showHeader;
		this.dashletQuery 				= dashletQuery;
		this.dashletBody 				= dashletBody;
		this.createdBy 					= createdBy;
		this.createdDate 				= createdDate;
		this.updatedBy 					= updatedBy;
		this.updatedDate 				= updatedDate;
		this.isActive 					= isActive;
		this.dashletQueryChecksum       = dashletQueryChecksum;
		this.dashletBodyChecksum 		= dashletBodyChecksum;
	}
	
	
	public String getDashletId() {
		return dashletId;
	}


	
	public void setDashletId(String dashletId) {
		this.dashletId = dashletId;
	}


	
	public String getDashletName() {
		return dashletName;
	}


	
	public void setDashletName(String dashletName) {
		this.dashletName = dashletName;
	}


	
	public String getDashletTitle() {
		return dashletTitle;
	}


	
	public void setDashletTitle(String dashletTitle) {
		this.dashletTitle = dashletTitle;
	}


	
	public Integer getXCoordinate() {
		return xCoordinate;
	}


	
	public void setXCoordinate(Integer xCoordinate) {
		this.xCoordinate = xCoordinate;
	}


	
	public Integer getYCoordinate() {
		return yCoordinate;
	}


	
	public void setYCoordinate(Integer yCoordinate) {
		this.yCoordinate = yCoordinate;
	}


	
	public Integer getWidth() {
		return width;
	}


	
	public void setWidth(Integer width) {
		this.width = width;
	}


	
	public Integer getHeight() {
		return height;
	}


	
	public void setHeight(Integer height) {
		this.height = height;
	}


	
	public String getContextId() {
		return contextId;
	}


	
	public void setContextId(String contextId) {
		this.contextId = contextId;
	}


	
	public Integer getShowHeader() {
		return showHeader;
	}


	
	public void setShowHeader(Integer showHeader) {
		this.showHeader = showHeader;
	}


	
	public String getDashletQuery() {
		return dashletQuery;
	}


	
	public void setDashletQuery(String dashletQuery) {
		this.dashletQuery = dashletQuery;
	}


	
	public String getDashletBody() {
		return dashletBody;
	}


	
	public void setDashletBody(String dashletBody) {
		this.dashletBody = dashletBody;
	}


	
	public String getCreatedBy() {
		return createdBy;
	}


	
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}


	
	public Date getCreatedDate() {
		return createdDate;
	}


	
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	
	public Integer getIsActive() {
		return isActive;
	}


	
	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}


	
	public String getUpdatedBy() {
		return updatedBy;
	}


	
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}


	
	public Date getUpdatedDate() {
		return updatedDate;
	}


	
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}


	
	public List<DashletProperties> getProperties() {
		return properties;
	}


	
	public void setProperties(List<DashletProperties> properties) {
		this.properties = properties;
	}


	
	public List<DashletRoleAssociation> getRoleAssociation() {
		return roleAssociation;
	}


	
	public void setRoleAssociation(List<DashletRoleAssociation> roleAssociation) {
		this.roleAssociation = roleAssociation;
	}


	
	public List<DashboardDashletAssociation> getDashboardAssociation() {
		return dashboardAssociation;
	}


	
	public void setDashboardAssociation(List<DashboardDashletAssociation> dashboardAssociation) {
		this.dashboardAssociation = dashboardAssociation;
	}


	
	public List<DashletRoleAssociation> getDashletRoleAssociations() {
		return dashletRoleAssociations;
	}


	
	public void setDashletRoleAssociations(List<DashletRoleAssociation> dashletRoleAssociations) {
		this.dashletRoleAssociations = dashletRoleAssociations;
	}
	
	
	
	public ContextMaster getContextMaster() {
		return contextMaster;
	}


	
	public void setContextMaster(ContextMaster contextMaster) {
		this.contextMaster = contextMaster;
	}

	

	public String getDashletQueryChecksum() {
		return dashletQueryChecksum;
	}


	public void setDashletQueryChecksum(String dashletQueryChecksum) {
		this.dashletQueryChecksum = dashletQueryChecksum;
	}


	public String getDashletBodyChecksum() {
		return dashletBodyChecksum;
	}


	public void setDashletBodyChecksum(String dashletBodyChecksum) {
		this.dashletBodyChecksum = dashletBodyChecksum;
	}


	public Integer getDashletTypeId() {
		return dashletTypeId;
	}


	public void setDashletTypeId(Integer dashletTypeId) {
		this.dashletTypeId = dashletTypeId;
	}


	@Override
	public int hashCode() {
		return Objects.hash(contextId, contextMaster, createdBy, createdDate, dashboardAssociation, dashletBody,
				dashletBodyChecksum, dashletId, dashletName, dashletQuery, dashletQueryChecksum,
				dashletRoleAssociations, dashletTitle, dashletTypeId, height, isActive, properties, roleAssociation,
				showHeader, updatedBy, updatedDate, width, xCoordinate, yCoordinate);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Dashlet other = (Dashlet) obj;
		return Objects.equals(contextId, other.contextId) && Objects.equals(contextMaster, other.contextMaster)
				&& Objects.equals(createdBy, other.createdBy) && Objects.equals(createdDate, other.createdDate)
				&& Objects.equals(dashboardAssociation, other.dashboardAssociation)
				&& Objects.equals(dashletBody, other.dashletBody)
				&& Objects.equals(dashletBodyChecksum, other.dashletBodyChecksum)
				&& Objects.equals(dashletId, other.dashletId) && Objects.equals(dashletName, other.dashletName)
				&& Objects.equals(dashletQuery, other.dashletQuery)
				&& Objects.equals(dashletQueryChecksum, other.dashletQueryChecksum)
				&& Objects.equals(dashletRoleAssociations, other.dashletRoleAssociations)
				&& Objects.equals(dashletTitle, other.dashletTitle)
				&& Objects.equals(dashletTypeId, other.dashletTypeId) && Objects.equals(height, other.height)
				&& Objects.equals(isActive, other.isActive) && Objects.equals(properties, other.properties)
				&& Objects.equals(roleAssociation, other.roleAssociation)
				&& Objects.equals(showHeader, other.showHeader) && Objects.equals(updatedBy, other.updatedBy)
				&& Objects.equals(updatedDate, other.updatedDate) && Objects.equals(width, other.width)
				&& Objects.equals(xCoordinate, other.xCoordinate) && Objects.equals(yCoordinate, other.yCoordinate);
	}


	@Override
	public String toString() {
		return "Dashlet [dashletId=" + dashletId + ", dashletName=" + dashletName + ", dashletTitle=" + dashletTitle
				+ ", xCoordinate=" + xCoordinate + ", yCoordinate=" + yCoordinate + ", width=" + width + ", height="
				+ height + ", contextId=" + contextId + ", showHeader=" + showHeader + ", dashletQuery=" + dashletQuery
				+ ", dashletBody=" + dashletBody + ", createdBy=" + createdBy + ", createdDate=" + createdDate
				+ ", updatedBy=" + updatedBy + ", updatedDate=" + updatedDate + ", isActive=" + isActive
				+ ", dashletQueryChecksum=" + dashletQueryChecksum + ", dashletBodyChecksum=" + dashletBodyChecksum
				+ ", dashletTypeId=" + dashletTypeId + ", properties=" + properties + ", roleAssociation="
				+ roleAssociation + ", dashboardAssociation=" + dashboardAssociation + ", dashletRoleAssociations="
				+ dashletRoleAssociations + ", contextMaster=" + contextMaster + "]";
	}


	public Dashlet getObject() {
		Dashlet dashlet = new Dashlet();
		
		dashlet.setContextId(contextId!=null?contextId.trim():contextId);
		dashlet.setContextMaster(contextMaster.getObject());
		dashlet.setCreatedBy(createdBy!=null?createdBy.trim():createdBy);
		dashlet.setCreatedDate(createdDate);
		
		List<DashboardDashletAssociation>	ddaOtr		= new ArrayList<>();
		if(dashboardAssociation != null && !dashboardAssociation.isEmpty()) {
			for(DashboardDashletAssociation obj : dashboardAssociation) {
				ddaOtr.add(obj.getObject());
			}
			dashlet.setDashboardAssociation(ddaOtr);
		} else dashlet.setDashboardAssociation(null);
		
		dashlet.setDashletBody(dashletBody!=null?dashletBody.trim():dashletBody);
		dashlet.setDashletBodyChecksum(dashletBodyChecksum!=null?dashletBodyChecksum.trim():dashletBodyChecksum);
		dashlet.setDashletId(dashletId!=null?dashletId.trim():dashletId);
		dashlet.setDashletName(dashletName!=null?dashletName.trim():dashletName);
		dashlet.setDashletQuery(dashletQuery!=null?dashletQuery.trim():dashletQuery);
		dashlet.setDashletQueryChecksum(dashletQueryChecksum!=null?dashletQueryChecksum.trim():dashletQueryChecksum);

		List<DashletRoleAssociation>	draOtr		= new ArrayList<>();
		if(dashletRoleAssociations != null && !dashletRoleAssociations.isEmpty()) {
			for(DashletRoleAssociation obj : dashletRoleAssociations) {
				draOtr.add(obj.getObject());
			}
			dashlet.setDashletRoleAssociations(draOtr);
		} else dashlet.setDashletRoleAssociations(null);
		
		dashlet.setDashletTitle(dashletTitle!=null?dashletTitle.trim():dashletTitle);
		dashlet.setDashletTypeId(dashletTypeId);
		dashlet.setHeight(height);
		dashlet.setIsActive(isActive);

		List<DashletProperties>	dpOtr		= new ArrayList<>();
		if(properties != null && !properties.isEmpty()) {
			for(DashletProperties obj : properties) {
				dpOtr.add(obj.getObject());
			}
			dashlet.setProperties(dpOtr);
		} else dashlet.setProperties(null);

		List<DashletRoleAssociation>	draOtr1		= new ArrayList<>();
		if(roleAssociation != null && !roleAssociation.isEmpty()) {
			for(DashletRoleAssociation obj : roleAssociation) {
				draOtr1.add(obj.getObject());
			}
			dashlet.setRoleAssociation(draOtr1);
		} else dashlet.setRoleAssociation(null);
		
		
		dashlet.setShowHeader(showHeader);
		dashlet.setUpdatedBy(updatedBy!=null?updatedBy.trim():updatedBy);
		dashlet.setUpdatedDate(updatedDate);
		dashlet.setWidth(width);
		dashlet.setXCoordinate(xCoordinate);
		dashlet.setYCoordinate(yCoordinate);
		return dashlet;
	}

}
