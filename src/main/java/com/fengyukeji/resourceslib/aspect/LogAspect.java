package com.fengyukeji.resourceslib.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

/**
 * Aop切面 日志类  
 * @author xt
 *
 * 2017年12月6日
 */
public class LogAspect {
	Logger logger = Logger.getLogger(Logger.class);
	String logStr=null;
	
	/**
	 * 前置通知
	 * @param jp
	 */
	public void doBefore(JoinPoint jp){
		logStr=jp.getTarget().getClass().getName()+"->"
                +jp.getSignature().getName()+" method...runing";
        logger.info(logStr);    
	}
	
	 /**
     * 环绕通知：包围一个连接点的通知，可以在方法的调用前后完成自定义的行为，也可以选择不执行。
     * 类似web中Servlet规范中Filter的doFilter方法。
     * @param pjp 当前进程中的连接点
     * @return
     */
    public Object doAround(ProceedingJoinPoint pjp){
        long Time=System.currentTimeMillis();
        Object result=null;
        try {
            result=pjp.proceed();
        } catch (Throwable e) {
            e.printStackTrace();
            logStr="method："+pjp.getTarget().getClass()+"."+pjp.getSignature().getName()+"()";
            logStr=logStr+"the error：["+e+"]";
            logger.error(logStr);
        }
        return result;
    }
    /**
     * 后置通知
     * @param jp
     */
    public void doAfter(JoinPoint jp){
        logStr=jp.getTarget().getClass().getName()+"->"
                +jp.getSignature().getName()+"method...End";
        logger.info(logStr);            
    }
}
