package com.zs.model;

import java.io.Serializable;

/**
 * responseTO,基础返回TO类
 */
public class ResponseCodeTO implements Serializable {
    
    private static final long serialVersionUID = 3643696267088634953L;

	/**
	 * 返回code
	 */
    private int code=0;
    
    /**
     * 返回提示
     */
    private String msg="success";

    /**
     * 返回数据
     */
    private Object data;

	public ResponseCodeTO(Object data) {
		this.data=data;
    }

	public ResponseCodeTO() {
    }

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
    
}
