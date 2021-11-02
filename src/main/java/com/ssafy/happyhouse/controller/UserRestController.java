package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.service.UserService;

import io.swagger.annotations.ApiOperation;

@RestController
@CrossOrigin("*")
@RequestMapping("/userapi")
public class UserRestController {
    @Autowired
    private UserService uService;
    
    private ResponseEntity<?> exceptionHandling(Exception e){
        e.printStackTrace();
        return new ResponseEntity<String>("Exception: "+e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);//500
    }
    @PostMapping("/user")
    @ApiOperation(value = "user 객체를 등록한다.", response = Integer.class)
    public ResponseEntity<?> insert(@RequestBody User user) {
        try {
            int result=uService.insert(user);
            return new ResponseEntity<Integer>(result,HttpStatus.CREATED);//201
        }catch(Exception e) {
            return exceptionHandling(e);
        }
    }
	
    @PutMapping("/user")
    @ApiOperation(value = "user 객체를 수정한다.", response = Integer.class)
    public ResponseEntity<?> update(@RequestBody User user) {
        try {
            int result=uService.update(user);
            if(result==1) return new ResponseEntity<Integer>(result,HttpStatus.CREATED);//201
            else          return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);//204
        }catch(Exception e) {
            return exceptionHandling(e);
        }
    }
    @DeleteMapping("/user/{id}")
    @ApiOperation(value = "{id}에 해당하는 user 객체를 삭제한다.", response = Integer.class)
    public ResponseEntity<?> delete(@PathVariable String id) {
        try {
            int result=uService.delete(id);
            if(result==1) return new ResponseEntity<Integer>(result,HttpStatus.CREATED);//201
            else          return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);//204
        }catch(Exception e) {
            return exceptionHandling(e);
        }
    }
	
    @GetMapping("/user/{id}")
    @ApiOperation(value = "{id}에 해당하는 user 정보를 반환한다.", response = User.class)
    public ResponseEntity<?> select(@PathVariable String id) {
        try {
        	User book=uService.select(id);
            if(book!=null) return new ResponseEntity<User>(book,HttpStatus.OK);//200
            else           return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);//204
        }catch(Exception e) {
            return exceptionHandling(e);
        }
    }
    
    @GetMapping("/user")
    @ApiOperation(value = "유저 목록을 반환한다.", response = User.class)    
    public ResponseEntity<?> search(){
        try {
            List<User> users=uService.search();
            if(users!=null && users.size()>0) return new ResponseEntity<List<User>>(users,HttpStatus.OK);//200
            else                              return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);//204
        }catch(Exception e) {
            return exceptionHandling(e);
        }
    }
    
}
