package com.ants;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author mayi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class AntsApplication
{
    private static final Logger log = LoggerFactory.getLogger(AntsApplication.class);
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(AntsApplication.class, args);
        System.out.println("     _          _          ____ _ _           _     \n" +
                "    / \\   _ __ | |_ ___   / ___| (_)_ __ ___ | |__  \n" +
                "   / _ \\ | '_ \\| __/ __| | |   | | | '_ ` _ \\| '_ \\ \n" +
                "  / ___ \\| | | | |_\\__ \\ | |___| | | | | | | | |_) |\n" +
                " /_/   \\_\\_| |_|\\__|___/  \\____|_|_|_| |_| |_|_.__/ ");
        System.out.println(" _____ _             _                                      __       _ _       \n" +
                "/  ___| |           | |                                    / _|     | | |      \n" +
                "\\ `--.| |_ __ _ _ __| |_   ___ _   _  ___ ___ ___  ___ ___| |_ _   _| | |_   _ \n" +
                " `--. \\ __/ _` | '__| __| / __| | | |/ __/ __/ _ \\/ __/ __|  _| | | | | | | | |\n" +
                "/\\__/ / || (_| | |  | |_  \\__ \\ |_| | (_| (_|  __/\\__ \\__ \\ | | |_| | | | |_| |\n" +
                "\\____/ \\__\\__,_|_|   \\__| |___/\\__,_|\\___\\___\\___||___/___/_|  \\__,_|_|_|\\__, |\n" +
                "                                                                          __/ |\n" +
                "                                                                         |___/ ");
        log.info("Springboot-Vue前后端分离框架启动成功...");
    }
}
