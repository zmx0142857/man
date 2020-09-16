/* 雪花算法 - 煲煲菜的博客
 * https://segmentfault.com/a/1190000011282426
 */
public class SnowFlake {

    // 初始时间戳
    private long epoch = 1288834974657L;
    // 上次时间戳, 初始值为负数
    private long lastTimestamp = -1L;

    // 工作机器 id 10bit, 分为工作 id 和数据 id
    private long workerId;     // 工作 id, 5bit
    private long dataCenterId; // 数据 id, 5bit
    private long sequence;     // 序列号, 12bit

    // 各 id 的长度
    private final long workerIdBits = 5L;
    private final long dataCenterIdBits = 5L;
    private final long sequenceBits = 12L;

    // 各 id 需要左移的位数
    private final long workerIdShift = sequenceBits; // 12
    private final long dataCenterIdShift = sequenceBits + workerIdBits; // 12+5
    private final long timestampLeftShift = sequenceBits + workerIdBits + dataCenterIdBits; // 12+5+5
    
    // 各 id 的最大值
    private final long maxWorkerId = -1L ^ (-1L << workerIdBits);
    private final long maxDatacenterId = -1L ^ (-1L << dataCenterIdBits);
    private final long sequenceMask = -1L ^ (-1L << sequenceBits);
    
    public SnowFlake(long workerId, long dataCenterId, long sequence) {
        // sanity check for workerId
        if (workerId > maxWorkerId || workerId < 0) {
            throw new IllegalArgumentException(String.format("worker Id can't be greater than %d or less than 0", maxWorkerId));
        }
        if (dataCenterId > maxDatacenterId || dataCenterId < 0) {
            throw new IllegalArgumentException(String.format("datacenter Id can't be greater than %d or less than 0", maxDatacenterId));
        }
        System.out.printf("worker starting.\ntimestamp left shift: %d\ndatacenter id bits: %d\nworker id bits: %d\nsequence bits: %d\nworkerid: %d\n", timestampLeftShift, dataCenterIdBits, workerIdBits, sequenceBits, workerId);

        this.workerId = workerId;
        this.dataCenterId = dataCenterId;
        this.sequence = sequence;
    }

    public long getWorkerId() {
        return workerId;
    }

    public long getDatacenterId() {
        return dataCenterId;
    }

    public long getTimestamp() {
        return System.currentTimeMillis();
    }

    // 下一个 ID 生成算法
    public synchronized long nextId() {
        long timestamp = System.currentTimeMillis();

        // 当前时间戳小于上次时间戳, 表示时间戳获取出现异常
        if (timestamp < lastTimestamp) {
            System.err.printf("clock is moving backwards.  Rejecting requests until %d.", lastTimestamp);
            throw new RuntimeException(String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds", lastTimestamp - timestamp));
        }

        // 当前时间戳等于上次时间戳 (同一毫秒内), 则序列号+1;
        // 否则序列号从 0 开始
        if (lastTimestamp == timestamp) {
            sequence = (sequence + 1) & sequenceMask;
            if (sequence == 0) {
                timestamp = tilNextMillis(lastTimestamp);
            }
        } else {
            sequence = 0;
        }
        
        lastTimestamp = timestamp; // 更新上次时间戳

        return ((timestamp - epoch) << timestampLeftShift) |
               (dataCenterId << dataCenterIdShift) |
               (workerId << workerIdShift) |
               sequence;
    }

    // 获取时间戳, 并与上次时间戳比较
    private long tilNextMillis(long lastTimestamp) {
        long timestamp = System.currentTimeMillis();
        while (timestamp <= lastTimestamp) {
            timestamp = System.currentTimeMillis();
        }
        return timestamp;
    }

    public static void main(String[] args) {
        SnowFlake worker = new SnowFlake(1, 1, 1);
        for (int i = 0; i < 30; i++) {
            System.out.println(worker.nextId());
        }
    }
}
