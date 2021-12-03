package com.hdn.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "COMMENT")
public class CommentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "createDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date createDate;

    @Column(name = "status")
    private int status;

    @OneToOne
    @JoinColumn(name = "parent_id", nullable = true)
    private CommentEntity parent;

    @ManyToOne
    @JoinColumn(name="user_id", nullable=false)
    private UserEntity user;

    @ManyToOne
    @JoinColumn(name="category_id", nullable=false)
    private CategoryEntity cate;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public CommentEntity getParent() {
        return parent;
    }

    public void setParent(CommentEntity parent) {
        this.parent = parent;
    }

    public CategoryEntity getCate() {
        return cate;
    }

    public void setCate(CategoryEntity cate) {
        this.cate = cate;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public CategoryEntity getCategoryEntity() {
        return cate;
    }

    public void setCategoryEntity(CategoryEntity categoryEntity) {
        this.cate = categoryEntity;
    }
}
