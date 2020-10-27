package com.trigyn.jws.usermanagement.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "jws_entity_role_association")
public class JwsEntityRoleAssociation {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(name = "entity_role_id")
	private String entityRoleId = null;
	
	@Column(name = "entity_id")
	private String entityId = null;
	
	@Column(name = "entity_name")
	private String entityName = null;
	
	@Column(name = "module_id")
	private String moduleId = null;
	
	@Column(name = "role_id")
	private String roleId = null;
	
	@ManyToOne
	@JoinColumn(name = "role_id", referencedColumnName = "role_id", insertable = false, updatable = false )
	private JwsRole role = null;
	
	@Column(name = "last_updated_date")
	@Temporal(TemporalType.DATE)
	private Date lastUpdatedDate = null;
	
	@Column(name = "last_updated_by")
	private String lastUpdatedBy = null;
	
	@Column(name = "is_active")
	private Integer isActive = null;

	public String getEntityRoleId() {
		return entityRoleId;
	}

	public void setEntityRoleId(String entityRoleId) {
		this.entityRoleId = entityRoleId;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public String getLastUpdatedBy() {
		return lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	
	
	
	
	
}