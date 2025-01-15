package Model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "Users") // Đổi tên bảng tại đây nếu cần thiết
public class User {
    // Thuộc tính và mối quan hệ
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Sử dụng IDENTITY cho cột tự tăng
    @Column(name = "Id")
    private Integer id;

    @Column(name = "Password", nullable = false)
    private String password;

    @Column(name = "Email", nullable = false, unique = true)
    private String email;

    @Column(name = "Fullname", nullable = false)
    private String fullname;

    @Column(name = "Admin", nullable = false, columnDefinition = "BIT DEFAULT 0") // Giá trị mặc định là 0 (false)
    private Boolean admin;

    @OneToMany(mappedBy = "user")
    private List<Favorite> favorites;
}
