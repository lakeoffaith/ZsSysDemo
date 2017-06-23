package com.zs.model;

public class Resource {
	private Long id;
	private String name;
	private String parent;
	private String permission;
	private int type;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Resource [id=" + id + ", name=" + name + ", parent=" + parent + ", permission=" + permission + ", type="
				+ type + "]";
	}
	
}
