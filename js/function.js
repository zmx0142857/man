// 头结点
function Func(val) {
  this.val = val;
  this.next = null;
  this.tail = this;
}

// 链表结点
function FuncNode(val, op) {
  this.val = val;
  this.op = op;
  this.next = null;
}

// 运算符
const ops = {
  'add': (x,y) => x+y,
  'sub': (x,y) => x-y,
  'mul': (x,y) => x*y,
  'div': (x,y) => x/y,
  'pow': Math.pow,
  'sin': Math.sin,
  'cos': Math.cos,
  'tan': Math.tan,
  'exp': Math.exp,
  'log': Math.log,
  'asin': Math.asin,
  'acos': Math.acos,
  'atan': Math.atan,
};

// 部署运算符到原型链上
for (let op of Object.keys(ops)) {
  Func.prototype[op] = function(val) {
    this.tail = this.tail.next = new FuncNode(val, op);
    return this;
  }
}

// 转字符串
Func.prototype.toString = function() {
  let buf = [this.val];
  let _ = this;
  while (_.next) {
    _ = _.next;
    buf.push(_.op);
    buf.push(_.val);
  }
  return buf.join(' ');
}

// 计算
Func.prototype.value = function(obj) {
  let ret = this.val;
  let _ = this;
  while (_.next) {
    _ = _.next;
    let val = _.val;
    if (typeof val === 'string' && val in obj)
      val = obj[val];
    ret = ops[_.op](ret, val);
  }
  return ret;
}

let f = new Func(1).add('x').mul(3).div('y').sin();
console.log(f.toString());
console.log(f.value({x:2, y:4}));
