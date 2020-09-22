package com.trigyn.jws.menu.utils;

public class Constants {

    private Constants() {

    }
    
    public static final Integer DEFAULT_LANGUAGE_ID = 1;
    public static final String TARGET_MODULE_PROCEDURE_NAME = "moduleTargetType";
    
	public enum RecordStatus {
		INSERTED(0), DELETED(1);
		
		final int status;
		
		RecordStatus(int i) {
			status = i;
		}
		
		public int getStatus() {
			return status;
		}
		
	}
}
