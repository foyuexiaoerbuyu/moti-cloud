package com.moti.utils;

import org.springframework.boot.SpringApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class SpringbootUtils {

    /**
     * 控制台打印浏览器访问地址
     */
    public static void printServiceUrl(ConfigurableApplicationContext application) {
        System.out.println(
                "  ____  __  __    ___    ___     __    ____    ____  \n" +
                        " /',__\\/\\ \\/\\ \\  /'___\\ /'___\\ /'__`\\ /',__\\  /',__\\ \n" +
                        "/\\__, `\\ \\ \\_\\ \\/\\ \\__//\\ \\__//\\  __//\\__, `\\/\\__, `\\\n" +
                        "\\/\\____/\\ \\____/\\ \\____\\ \\____\\ \\____\\/\\____/\\/\\____/\n" +
                        " \\/___/  \\/___/  \\/____/\\/____/\\/____/\\/___/  \\/___/");
        Environment env = application.getEnvironment();
        String ip = null;
        try {
            ip = InetAddress.getLocalHost().getHostAddress();
            String port = env.getProperty("server.port");
            String path = env.getProperty("server.servlet.context-path");
//            if (path == null) {
//                path = env.getProperty("context-path");
//            }
            if (StringUtils.isEmpty(path)) {
                path = "";
            }
            if (StringUtils.isEmpty(port)) {
                port = "8080";
            }
            System.out.println("----------------------------------------------------------\n\t" +
                    "Application  is running! Access URLs:\n\t" +
                    "Local访问网址: \t\thttp://localhost:" + port + path + "\n\t" +
                    "External访问网址: \thttp://" + ip + ":" + port + path + "\n" +
                    "----------------------------------------------------------");
            String jvmName = ManagementFactory.getRuntimeMXBean().getName();
            System.out.println("当前项目进程号：" + jvmName.split("@")[0]);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }

    /**
     * 停止服务
     */
    public static void shutdown(ConfigurableApplicationContext application) {
        SpringApplication.exit(application, () -> 0);
    }

    /**
     * 打开浏览器
     */
    public static void open(String url) throws RuntimeException {
//        try {
//            Desktop desktop = Desktop.getDesktop();
//            if (Desktop.isDesktopSupported() && desktop.isSupported(Desktop.Action.BROWSE))
//                desktop.browse(new URI(url));
//        } catch (Exception e) {
//            e.printStackTrace();
        try {
            Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + url);
        } catch (Exception ioException) {
            ioException.printStackTrace();
            throw new RuntimeException("打开浏览器失败");
        }
//        }
    }

    public static String getIP() {

        try {
            return InetAddress.getLocalHost().getHostAddress();
//            Runtime.getRuntime().exec("cmd   /c   start   http://" + hostAddress + ":8088/files");//可以指定自己的路径
        } catch (Exception ex) {
            ex.printStackTrace();
            return "127.0.0.1";
        }
    }

    public static void openUrl(String url) {
        try {
            Runtime.getRuntime().exec("cmd /c start " + url);
        } catch (Exception ex) {
        }
    }

    public static String getClientIpAddress(HttpServletRequest request, String logMsg) {
        System.out.println("ComUtils#getClientIpAddress = " + logMsg);
        String ipAddress = request.getHeader("X-Forwarded-For");

        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_CLUSTER_CLIENT_IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_FORWARDED_FOR");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_FORWARDED");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_VIA");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("REMOTE_ADDR");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }

        // 如果客户端经过代理，X-Forwarded-For可以包含多个IP，第一个为真实IP
        if (ipAddress != null && ipAddress.contains(",")) {
            ipAddress = ipAddress.split(",")[0].trim();
        }
        System.out.println("ipAddress = " + ipAddress);
        return ipAddress;
    }
}
