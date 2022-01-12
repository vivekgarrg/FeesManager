
package feeBean;

public class RegisterBean {
   private String name;
   private String fname;
   private String classes;
   private String section;
   private long contact;
   private int roll_no;
   
   public void setRollNo(int roll_no)
   {
       this.roll_no = roll_no;
   }
   public int getRollNo()
   {
       return roll_no;
   }
   public void setContact(long contact)
   {
       this.contact = contact;
   }
   public long getContact()
   {
       return contact;
   }
   
   public void setName(String name)
   {
       this.name = name;
   }
   public void setFName(String fname)
   {
        this.setFname(fname);
   }
   public void setClass(String classes)
   {
        this.setClasses(classes);
   }
   public void setSection(String section)
   {
       this.section = section;
   }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return the classes
     */
    public String getClasses() {
        return classes;
    }

    /**
     * @param classes the classes to set
     */
    public void setClasses(String classes) {
        this.classes = classes;
    }

    /**
     * @return the section
     */
    public String getSection() {
        return section;
    }
    
            
    
}
