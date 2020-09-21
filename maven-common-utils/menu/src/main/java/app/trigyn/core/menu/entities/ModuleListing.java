package app.trigyn.core.menu.entities;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.util.List;
import java.util.Objects;


/**
 * The persistent class for the module_listing database table.
 * 
 */
@Entity
@Table(name="module_listing")
@NamedQuery(name="ModuleListing.findAll", query="SELECT m FROM ModuleListing m")
public class ModuleListing implements Serializable {
	private static final long serialVersionUID 		= 1L;

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(name="module_id")
	private String moduleId							= null;

	@Column(name="module_url")
	private String moduleUrl						= null;

	@Column(name="parent_id")
	private String parentId							= null;

	@Column(name="sequence")
	private Integer sequence						= null;
	
	@Column(name="target_lookup_id")
	private Integer targetLookupId					= null;
	
	@Column(name="target_type_id")
	private String targetTypeId						= null;

	@OneToMany(mappedBy="moduleListing")
	private List<ModuleListingI18n> moduleListingI18ns					= null;

	@OneToMany(mappedBy="moduleListing")
	private List<ModuleRoleAssociation> moduleRoleAssociations			= null;

	@ManyToOne
	@JoinColumn(name="target_lookup_id", insertable = false, updatable = false)
	private ModuleTargetLookup moduleTargetLookup						= null;

	public ModuleListing() {
	}



	public ModuleListing(String moduleId, String moduleUrl, String parentId,
			Integer sequence, String targetTypeId, List<ModuleListingI18n> moduleListingI18ns,
			List<ModuleRoleAssociation> moduleRoleAssociations, ModuleTargetLookup moduleTargetLookup) {
		this.moduleId 					= moduleId;
		this.moduleUrl 					= moduleUrl;
		this.parentId 					= parentId;
		this.sequence 					= sequence;
		this.targetTypeId 				= targetTypeId;
		this.moduleListingI18ns 		= moduleListingI18ns;
		this.moduleRoleAssociations 	= moduleRoleAssociations;
		this.moduleTargetLookup 		= moduleTargetLookup;
	}



	public ModuleListing(String moduleId, String moduleUrl, String parentId,
			Integer sequence, Integer targetLookupId, String targetTypeId, List<ModuleListingI18n> moduleListingI18ns,
			List<ModuleRoleAssociation> moduleRoleAssociations, ModuleTargetLookup moduleTargetLookup) {
		this.moduleId 					= moduleId;
		this.moduleUrl 					= moduleUrl;
		this.parentId 					= parentId;
		this.sequence 					= sequence;
		this.targetLookupId 			= targetLookupId;
		this.targetTypeId 				= targetTypeId;
		this.moduleListingI18ns 		= moduleListingI18ns;
		this.moduleRoleAssociations 	= moduleRoleAssociations;
		this.moduleTargetLookup 		= moduleTargetLookup;
	}



	public String getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public String getModuleUrl() {
		return this.moduleUrl;
	}

	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Integer getSequence() {
		return this.sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public Integer getTargetLookupId() {
		return targetLookupId;
	}

	public void setTargetLookupId(Integer targetLookupId) {
		this.targetLookupId = targetLookupId;
	}

	public String getTargetTypeId() {
		return targetTypeId;
	}

	public void setTargetTypeId(String targetTypeId) {
		this.targetTypeId = targetTypeId;
	}

	public List<ModuleListingI18n> getModuleListingI18ns() {
		return this.moduleListingI18ns;
	}

	public void setModuleListingI18ns(List<ModuleListingI18n> moduleListingI18ns) {
		this.moduleListingI18ns = moduleListingI18ns;
	}

	public ModuleListingI18n addModuleListingI18n(ModuleListingI18n moduleListingI18n) {
		getModuleListingI18ns().add(moduleListingI18n);
		moduleListingI18n.setModuleListing(this);

		return moduleListingI18n;
	}

	public ModuleListingI18n removeModuleListingI18n(ModuleListingI18n moduleListingI18n) {
		getModuleListingI18ns().remove(moduleListingI18n);
		moduleListingI18n.setModuleListing(null);

		return moduleListingI18n;
	}

	public List<ModuleRoleAssociation> getModuleRoleAssociations() {
		return this.moduleRoleAssociations;
	}

	public void setModuleRoleAssociations(List<ModuleRoleAssociation> moduleRoleAssociations) {
		this.moduleRoleAssociations = moduleRoleAssociations;
	}

	public ModuleRoleAssociation addModuleRoleAssociation(ModuleRoleAssociation moduleRoleAssociation) {
		getModuleRoleAssociations().add(moduleRoleAssociation);
		moduleRoleAssociation.setModuleListing(this);

		return moduleRoleAssociation;
	}

	public ModuleRoleAssociation removeModuleRoleAssociation(ModuleRoleAssociation moduleRoleAssociation) {
		getModuleRoleAssociations().remove(moduleRoleAssociation);
		moduleRoleAssociation.setModuleListing(null);

		return moduleRoleAssociation;
	}

	public ModuleTargetLookup getModuleTargetLookup() {
		return this.moduleTargetLookup;
	}

	public void setModuleTargetLookup(ModuleTargetLookup moduleTargetLookup) {
		this.moduleTargetLookup = moduleTargetLookup;
	}



	@Override
	public int hashCode() {
		return Objects.hash(moduleId, moduleListingI18ns, moduleRoleAssociations, moduleTargetLookup,
				moduleUrl, parentId, sequence, targetLookupId, targetTypeId);
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
		ModuleListing other = (ModuleListing) obj;
		return  Objects.equals(moduleId, other.moduleId)
				&& Objects.equals(moduleListingI18ns, other.moduleListingI18ns)
				&& Objects.equals(moduleRoleAssociations, other.moduleRoleAssociations)
				&& Objects.equals(moduleTargetLookup, other.moduleTargetLookup)
				&& Objects.equals(moduleUrl, other.moduleUrl) && Objects.equals(parentId, other.parentId)
				&& Objects.equals(sequence, other.sequence) && Objects.equals(targetLookupId, other.targetLookupId)
				&& Objects.equals(targetTypeId, other.targetTypeId);
	}



	@Override
	public String toString() {
		return "ModuleListing [moduleId=" + moduleId + ", moduleUrl="
				+ moduleUrl + ", parentId=" + parentId + ", sequence=" + sequence + ", targetLookupId=" + targetLookupId
				+ ", targetTypeId=" + targetTypeId + ", moduleListingI18ns=" + moduleListingI18ns
				+ ", moduleRoleAssociations=" + moduleRoleAssociations + ", moduleTargetLookup=" + moduleTargetLookup
				+ "]";
	}




}