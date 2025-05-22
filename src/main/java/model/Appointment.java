package model;

public class Appointment {
    private String serviceType;
    private String date;
    private String time;
    private String petName;
    private String petType;
    private int userId;

    public Appointment(String serviceType, String date, String time,
                       String petName, String petType, int userId) {
        this.serviceType = serviceType;
        this.date = date;
        this.time = time;
        this.petName = petName;
        this.petType = petType;
        this.userId = userId;
    }

    public String getServiceType() { return serviceType; }
    public String getDate() { return date; }
    public String getTime() { return time; }
    public String getPetName() { return petName; }
    public String getPetType() { return petType; }
    public int getUserId() { return userId; }
}
