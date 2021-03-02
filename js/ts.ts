// [install]
// npm install typescript
// npx tsc hello.ts

// [在接口中指定类型]
interface User {
  name: string; // 注意分号, 不是逗号
  id: number;
  [propName: string]: any; // allow any other properties
}

// 对象使用接口
const user: User = {
  name: "Hayes",
  id: 0,
};
console.log(user)

// [在类中指定类型]
class UserAccount implements User {
  name: string;
  id: number;

  constructor(name: string, id: number) { // 参数可以指定类型
    this.name = name;
    this.id = id;
  }

  getAdminUser(): User { // 返回值也可以指定类型
    return this;
  }
}

// ok, 类的定义符合该接口
const user2: User = new UserAccount('Murphy', 1);

// [泛型]
interface Backpack<Type> {
  add: (obj: Type) => void;
  get: () => Type;
}

declare const backpack: Backpack<string>; // 这行代码不会出现在编译结果中

const object = backpack.get();

// [enum]
enum Color {
  Red = 1,
  Green,
  Blue,
}
let colorName: string = Color[2];

// Displays 'Green'
console.log(colorName);

// [optioinal properties]
interface SquareConfig {
  color?: string;
  width?: number;
}

// [readonly properties]
interface Point {
  readonly x: number;
  readonly y: number;
}

// [readonly array]
let ro: ReadonlyArray<number> = [1, 2, 3];
// type cast (to mutable array)
let a = ro as number[];
