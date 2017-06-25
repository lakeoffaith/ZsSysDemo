package com.zs.model;

import java.util.List;
import java.util.stream.Collectors;

public class Resource {
	public static final int MANAGEBLOCK = 0;
	public static final int FLOWBLOCK = 1;
	public static final int OTHERBLOCK = 2;
	private Long id;
	private String name;
	private String parent;
	private String permission;
	private int type;
	private String icon;
	private String url;
	private int blockType;
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
	
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public int getBlockType() {
		return blockType;
	}
	public void setBlockType(int blockType) {
		this.blockType = blockType;
	}
	@Override
	public String toString() {
		return "Resource [id=" + id + ", name=" + name + ", parent=" + parent + ", permission=" + permission + ", type="
				+ type + ", icon=" + icon + ", url=" + url + ", blockType=" + blockType + "]";
	}
	public static List<Resource> listByBlockType(List<Resource> lists, int typeNum) {
		// TODO Auto-generated method stub
		return lists.stream().filter(s->s.blockType==typeNum).collect(Collectors.toList());
	}
	
	
	
}
