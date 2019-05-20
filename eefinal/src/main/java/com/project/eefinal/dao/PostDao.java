package com.project.eefinal.dao;

import com.project.eefinal.model.Post;

import java.util.List;

public interface PostDao {
    boolean addPost(Post post);
    boolean delPost(Integer id);
    boolean updatePost(Post post);
    List<Post> queryPosts(Post post);
}
