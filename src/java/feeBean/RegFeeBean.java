
package feeBean;

public class RegFeeBean {
    private int student_id;
    private int totalFee;
    private int paidFee;
    private int balanceFee;
    private String remarks;

    public int getStudent_id() {
        return student_id;
    }

    public int getTotalFee() {
        return totalFee;
    }

    public int getPaidFee() {
        return paidFee;
    }

    public int getBalanceFee() {
        return balanceFee;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public void setTotalFee(int totalFee) {
        this.totalFee = totalFee;
    }

    public void setPaidFee(int paidFee) {
        this.paidFee = paidFee;
    }

    public void setBalanceFee(int balanceFee) {
        this.balanceFee = balanceFee;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    
}
