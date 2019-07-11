package me.pf.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.BAD_REQUEST;

/**
 * 统一异常处理
 * Created by : PF
 * Date on : 2019-07-11.
 */
@Getter
public class BadRequestException  extends RuntimeException {

    private Integer status = BAD_REQUEST.value();

    public BadRequestException(String msg){
        super(msg);
    }

    public BadRequestException(HttpStatus status,String msg){
        super(msg);
        this.status = status.value();
    }

}

