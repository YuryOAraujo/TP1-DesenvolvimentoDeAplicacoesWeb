package yoa.cardiology.hospital.utilities;

public enum ReportStatus {
	TEMPORARY("Provisório"),
	DEFINITIVE("Definitivo");
	
	private final String STATUS;

	private ReportStatus(String STATUS) {
		this.STATUS = STATUS;
	}

	public String getSTATUS() {
		return STATUS;
	}	
	
	@Override
	public String toString() {
		return this.STATUS;
	}
}
