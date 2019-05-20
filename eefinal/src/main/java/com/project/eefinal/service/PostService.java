package com.project.eefinal.service;

import com.project.eefinal.dao.PostDao;
import com.project.eefinal.model.Post;
import javafx.geometry.Pos;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PostService {
    @Resource
    private PostDao postDao;

    public boolean addPost(Post post){
        return postDao.addPost(post);
    }

    public boolean delPost(Integer id){
        return postDao.delPost(id);
    }

    public boolean updatePost(Post post){
        return postDao.updatePost(post);
    }

    public List<Post> queryPosts(Post post){
        return postDao.queryPosts(post);
    }
}
