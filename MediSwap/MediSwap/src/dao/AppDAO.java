package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import form.Medicine;
import form.MedicineSubstitute;

public class AppDAO {

    public static boolean isValidUser(String username, String password) {
        boolean isValidUser = false;

        try {
            ResultSet rs = MyConnection.getConnection().createStatement()
                    .executeQuery("select * from login where username='" + username + "' and password='" + password + "'");

            while (rs.next()) {
                isValidUser = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isValidUser;
    }

    public static int addMedicine(Medicine medicine) {
        int result = 0;

        try {
            PreparedStatement ps = MyConnection.getConnection()
                    .prepareStatement("insert into medicines (id, name, sideeffects, purpose) values (?,?,?,?)");

            ps.setInt(1, 0);
            ps.setString(2, medicine.getName());
            ps.setString(3, medicine.getSideeffects());
            ps.setString(4, medicine.getPurpose());

            result = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static int delteMedicine(int id) {
        int result = 0;

        try {
            PreparedStatement ps1 = MyConnection.getConnection().prepareStatement("delete from medicines where id='" + id + "'");
            PreparedStatement ps2 = MyConnection.getConnection().prepareStatement("delete from medicinesubstitutes where medicine='" + id + "'");

            if (ps1.executeUpdate() == 1 && ps2.executeUpdate() == 1) {
                result = 1;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static Medicine getMedicineById(int id) {
        Medicine medicine = new Medicine();

        try {
            PreparedStatement ps = MyConnection.getConnection().prepareStatement("select * from medicines where id='" + id + "'");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                medicine.setId(rs.getInt(1));
                medicine.setName(rs.getString(2));
                medicine.setSideeffects(rs.getString(3));
                medicine.setPurpose(rs.getString(4)); // Set purpose field
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return medicine;
    }

    public static List<Medicine> getMedicines() {
        List<Medicine> medicinesList = new ArrayList<Medicine>();

        try {
            PreparedStatement ps = MyConnection.getConnection().prepareStatement("select * from medicines");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Medicine medicine = new Medicine();

                medicine.setId(rs.getInt(1));
                medicine.setName(rs.getString(2));
                medicine.setSideeffects(rs.getString(3));
                medicine.setPurpose(rs.getString(4)); // Set purpose field

                medicinesList.add(medicine);
            }

            // Sort the list by medicine name
            Collections.sort(medicinesList, new Comparator<Medicine>() {
                @Override
                public int compare(Medicine m1, Medicine m2) {
                    return m1.getName().compareToIgnoreCase(m2.getName());
                }
            });

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return medicinesList;
    }

    public static List<Medicine> searchMedicinesByName(String name) {
        List<Medicine> medicinesList = new ArrayList<Medicine>();

        try {
            PreparedStatement ps = MyConnection.getConnection()
                    .prepareStatement("select * from medicines where name like '%" + name + "%'");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Medicine medicine = new Medicine();

                medicine.setId(rs.getInt(1));
                medicine.setName(rs.getString(2));
                medicine.setSideeffects(rs.getString(3));
                medicine.setPurpose(rs.getString(4)); // Set purpose field

                medicinesList.add(medicine);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return medicinesList;
    }

    public static int addMedicineSubstitute(MedicineSubstitute medicineSubstitute) {
        int result = 0;

        try {
            PreparedStatement ps = MyConnection.getConnection().prepareStatement("insert into medicinesubstitutes values(?,?,?)");

            ps.setInt(1, 0);
            ps.setInt(2, medicineSubstitute.getMedicine());
            ps.setInt(3, medicineSubstitute.getSubstitute());

            result = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static int delteMedicineSubstitute(int id) {
        int result = 0;

        try {
            PreparedStatement ps = MyConnection.getConnection().prepareStatement("delete from medicinesubstitutes where id='" + id + "'");
            result = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static List<MedicineSubstitute> getMedicineSubstitutesByMedicineId(int id) {
        List<MedicineSubstitute> medicineSubstitutesList = new ArrayList<MedicineSubstitute>();

        try {
            PreparedStatement ps = MyConnection.getConnection().prepareStatement("select * from medicinesubstitutes where medicine='" + id + "'");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MedicineSubstitute medicineSubstitute = new MedicineSubstitute();

                medicineSubstitute.setId(rs.getInt(1));
                medicineSubstitute.setMedicine(rs.getInt(2));
                medicineSubstitute.setSubstitute(rs.getInt(3));

                medicineSubstitutesList.add(medicineSubstitute);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return medicineSubstitutesList;
    }
}
