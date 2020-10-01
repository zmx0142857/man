import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

/* 这里使用旧版 api
 * 也可以改用 java 11 的 HttpClient
 */
public class HttpClient {
    public static void main(String[] args) throws IOException {
        URL url = new URL("http://localhost");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setUseCaches(false);
        conn.setConnectTimeout(5000); // 请求超时5秒
        // 设置HTTP头:
        conn.setRequestProperty("Accept", "*/*");
        conn.setRequestProperty("User-Agent", "Mozilla/5.0 (compatible; MSIE 11; Windows NT 5.1)");
        // 连接并发送HTTP请求:
        conn.connect();
        // 判断HTTP响应是否200:
        if (conn.getResponseCode() != 200) {
            throw new RuntimeException("bad response");
        }
        // 获取响应头
        Map<String, List<String>> map = conn.getHeaderFields();
        for (String key : map.keySet()) {
            System.out.println(key + ": " + map.get(key));
        }
        System.out.println("");
        // 获取响应内容
        BufferedReader reader = new BufferedReader(
            new InputStreamReader(
                conn.getInputStream(), StandardCharsets.UTF_8
            )
        );
        String text;
        while ((text = reader.readLine()) != null) {
            System.out.println(text);
        }
        // 清理工作
        reader.close();
        conn.disconnect();
    }
}
