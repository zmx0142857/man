# Java

## 相关工具

### jar

jar 包就是 zip 格式的包, 创建一个 zip 包, 把后缀改为 jar 即可

	$ jar fvt tmp.jar # 查看

把 jar 包加入 classpath 并运行程序

    $ java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App

若在 jar 包的 META-INF/MANIFEST.MF 中指定了 Main-Class, 就不必指定启动的类名

	$ java -jar tmp.jar # 直接执行程序

### run a package

	$ tree
	.
	└── hello
		└── Hello.class

	1 directory, 1 file
	$ java hello.Hello

### build a package

	$ tree
	.
	├── bin
	│   ├── hong
	│   └── ming
	└── src
		├── hong
		│   └── Person.java
		└── ming
			└── Person.java

	6 directories, 2 files
	$ cat src/hong/Person.java
	package hong;
	public class Person {}
	$ cat src/ming/Person.java
	package ming;
	public class Person {}
	$ javac -d bin src/hong/Person.java src/ming/Person.java
	$ tree
	.
	├── bin
	│   ├── hong
	│   │   └── Person.class
	│   └── ming
	│       └── Person.class
	└── src
		├── hong
		│   └── Person.java
		└── ming
			└── Person.java

	6 directories, 4 files

### 其它

* jps 查看 java 进程
* jconsole 用 jmx 协议查看 java 进程详情

## 基本操作

### IO

```java
// 读取输入
Scanner scanner = new Scanner(System.in);
String str = scanner.next(); // nextInt, nextDouble...

// 资源流
getClass().getResourceAsStream("/common/setting.properties");

// 内存输入流
new ByteArrayInputStream(byteArr);

// 读取中文。InputStream 是字节流，而 Reader 是字符流 (char)，能自动解码
new FileReader("setting.properties", StandardCharsets.UTF_8);

// File
File f = new File(path);
f.isFile();
f.isDirectory();
f.length();
f.canRead();
f.canWrite();
f.canExecute();
if (f.createNewFile()) {}
if (f.delete()) {}
File.createTempFile("file", ".txt"); f.deleteOnExit(); // 创建临时文件，程序结束时删除
若 f 是目录，可以用 list() 和 listFiles() 列出文件与子目录，返回 File[]

// Stream
byte[] buf = new byte[1000];
try {
    InputStream input = new FileInputStream("readme.txt");
    while (input.read(buf) != -1) { }
} finally {
    if (input != null)
        input.close();
}

// Stream 方法二 JDK 7
byte[] buf = new byte[1000];
try (InputStream input = new FileInputStream("readme.txt")) {
    while (input.read(buf) != -1) { }
}

// OutputStream
try (OutputStream output = new FileOutputStream("output.txt")) {
    output.write("Hello".getBytes("UTF-8"));
}
```

### 读取 Properties

`setting.properties`
```properties
file=/data/hello.txt
auto_save_interval=60
```

```java
Properties props = new Properties();
props.load(new FileInputStream("setting.properties"));
props.getProperty("file", "default_value");
```

### var

```java
var student = new Student(); // 自动类型推断, JDK 10
```

### String 与 Array

```java
str.equals(otherStr)    // String 比较不能用 ==，可以用 switch
str.toCharArray()       // String 转 char[]
new String(charArr)     // char[] 转 String
str.getBytes("UTF-8")   // String 转 byte[]
Integer.parseInt(str) -> int
Integer.valueOf(str) -> Integer

"123".equals(str); // 避免 str 为 null 时，str.equals("123") 报错
Object.equals(obj1, obj2); // 避免 obj1 为 null 时，obj1.equals(obj2) 报错

array.length            // 数组长度
Arrays.sort(array)      // 排序
```

### List 与 Map

#### List

```java
// List 转数组
Integer[] arr = list.toArray(new Integer[list.size()]); // 方法一
Integer[] arr = list.toArray(Integer[]::new); // 方法二
// 数组转 List
List<Integer> list = List.of(arr); // JDK 11
Arrays.asList(T...) // 旧方法

List<Integer> list = List.of(1, 2, 5); // 创建不可变 List，无法添加删除元素
// 遍历 List 方法一
Iterator<Integer> it = list.iterator();
while (it.hasNext()) {
    System.out.println(it.next());
}
// 遍历 List 方法二
for (Integer i : list) {
    System.out.println(i);
}
list.contains(obj); // 返回 true/false
indexOf(obj); // 返回下标，失败时返回 -1

Collections.shuffle(list); // 洗牌
list.get((int)(Math.random() * list.size())); // 随机元素
```

#### Map

```java
Map<String, Integer> map = new HashMap<>();
map.put(key, value);
map.get(key);
map.containsKey(key); // 返回 true/false
// 遍历 Map 方法一
for (String key : map.keySet()) {
    System.out.println(key + ": " + map.get(key));
}
// 遍历 Map 方法二
for (Map.Entry<String, Integer> entry : map.entrySet()) {
    System.out.println(entry.getKey() + ": " + entry.getValue());
}
```

#### Queue

```java
q.offer(E); q.add(E); // 后者失败时抛出异常
q.poll(); q.remove(); // 后者失败时抛出异常
q.peek(); q.element(); // 后者失败时抛出异常

// 用 Deque 模拟 Stack。注意不要使用遗留类 Stack
s.push(E); s.pop(); // 失败时抛出异常
s.peek();
```

### 例: 消息去重

```java
// 按sequence去除重复消息
static List<Message> process(List<Message> received) {
    List<Message> copyList = new ArrayList<>();
    Set<Message> set = new TreeSet<>((Message m1, Message m2) -> {
        return m1.sequence - m2.sequence;
    });
    /* 相当于
    Set<Message> set = new TreeSet<>(new Comparator<Message>() {
        @Override
        public int compare(Message m1, Message m2) {
            return m1.sequence - m2.sequence;
        }
    });
    */
    for (Message m : received) {
        if (set.add(m)) {
            copyList.add(m);
        }
    }
    return copyList;
}

// 方法二
static List<Message> process(List<Message> received) {
    List<Message> copyList = new ArrayList<>();
    Set<Integer> set = new HashSet<>();
    for (Message m : received) {
        if (set.add(m.sequence)) {
            copyList.add(m);
        }
    }
    return copyList;
}
```

### 其它

```java
// 获取毫秒数
System.currentTimeMillis();

// 不需要序列化的字段用 transient 修饰
private transient long fastTime;

// URLEncode & Decode
String s1 = URLDecoder.decode("%B2%E2%CA%D4%A3%AC%C7%EB%BA%F6%C2%D4%A1%A3", "GBK");
String s2 = URLDecoder.decode("%D3%EE%D6%E6%B5%C4%C4%B3%B8%F6%BD%C7%C2%E4", "GBK");
System.out.println(s1);
System.out.println(URLEncoder.encode(s1, "GBK"));

// hash 碰撞
System.out.println("AaAaAa".hashCode());
System.out.println("BBAaBB".hashCode());

// "全局变量"
class Counter {
    public static int count = 0;
}
```

### 多线程

```java
// 一个线程安全的类
class Counter {
    private int count = 0;

    public synchronized void add(int n) {
        count += n;
    }
    /* 相当于
     * public void add(int n) {
     *     synchronized (this) {
     *         count += n;
     *     }
     * }
     */

    public synchronized void dec(int n) {
        count -= n;
    }

    public int get() {
        return count; // 原子操作，不必加锁
    }
}
```
此外，String, Integer, LocalDate 这些成员变量都是 final 的不变类也是线程安全的，
Math 这样只有静态方法的类也是线程安全的。

### 解析 xml

```java
InputStream input = Main.class.getResourceAsStream("/book.xml");
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse(input);
```

### 动态代理 - 在运行时实现接口

#### 例一

```java
interface Hello {
    void morning(String name);
}

// main
Hello hello = (Hello) Proxy.newProxyInstance(
    Hello.class.getClassLoader(), // class loader
    new Class[]{Hello.class}, // 要实现的接口
    (proxy, method, objects) -> { // 代理的实现
        if ("morning".equals(method.getName())) {
            System.out.println("Good morning, " + objects[0]);
        }
        return null;
    }
);
hello.morning("Bob");
```

#### 例二

```java
interface Service {
    void add();
    void del();
    void set();
    void get();
}

class ServiceImpl implements Service {
    @Override
    public void add() {
        System.out.println("增");
    }

    @Override
    public void del() {
        System.out.println("删");
    }

    @Override
    public void set() {
        System.out.println("改");
    }

    @Override
    public void get() {
        System.out.println("查");
    }
}

// main
Service service = (Service) Proxy.newProxyInstance(
    Service.class.getClassLoader(),
    new Class[]{Service.class},
    new InvocationHandler() {
        private ServiceImpl serviceImpl = new ServiceImpl();
        @Override
        public Object invoke(Object proxy, Method method, Object[] objects) throws Throwable {
            System.out.println("[debug] " + method.getName());
            return method.invoke(serviceImpl, objects);
        }
    }
);
service.add();
service.del();
service.set();
service.get();
```
