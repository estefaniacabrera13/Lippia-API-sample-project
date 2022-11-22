package api.model.hours;

import java.util.List;

public class HoursResponseItem {
	private Object tagIds;
	private String description;
	private String type;
	private String userId;
	private boolean billable;
	private List<Object> customFieldValues;
	private boolean isLocked;
	private TimeInterval timeInterval;
	private String id;
	private String projectId;
	private Object kioskId;
	private Object taskId;
	private String workspaceId;

	public void setTagIds(Object tagIds){
		this.tagIds = tagIds;
	}

	public Object getTagIds(){
		return tagIds;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getDescription(){
		return description;
	}

	public void setType(String type){
		this.type = type;
	}

	public String getType(){
		return type;
	}

	public void setUserId(String userId){
		this.userId = userId;
	}

	public String getUserId(){
		return userId;
	}

	public void setBillable(boolean billable){
		this.billable = billable;
	}

	public boolean isBillable(){
		return billable;
	}

	public void setCustomFieldValues(List<Object> customFieldValues){
		this.customFieldValues = customFieldValues;
	}

	public List<Object> getCustomFieldValues(){
		return customFieldValues;
	}

	public void setIsLocked(boolean isLocked){
		this.isLocked = isLocked;
	}

	public boolean isIsLocked(){
		return isLocked;
	}

	public void setTimeInterval(TimeInterval timeInterval){
		this.timeInterval = timeInterval;
	}

	public TimeInterval getTimeInterval(){
		return timeInterval;
	}

	public void setId(String id){
		this.id = id;
	}

	public String getId(){
		return id;
	}

	public void setProjectId(String projectId){
		this.projectId = projectId;
	}

	public String getProjectId(){
		return projectId;
	}

	public void setKioskId(Object kioskId){
		this.kioskId = kioskId;
	}

	public Object getKioskId(){
		return kioskId;
	}

	public void setTaskId(Object taskId){
		this.taskId = taskId;
	}

	public Object getTaskId(){
		return taskId;
	}

	public void setWorkspaceId(String workspaceId){
		this.workspaceId = workspaceId;
	}

	public String getWorkspaceId(){
		return workspaceId;
	}
}