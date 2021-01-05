function Sql(cols) {
  this.cols = cols
}

Sql.prototype.from = function (table) {
  this.result = table.slice() // shallow copy
  return this
}

Sql.prototype.where = function (condition) {
  if (condition) {
    this.result = this.result.filter(condition)
  }
  return this
}

Sql.prototype.orderby = function (key) {
  this.result = this.result.sort((a,b) =>
    a[key] > b[key] ? 1 : a[key] < b[key] ? -1 : 0
  )
  return this
}

Sql.prototype.join = function (table) {
  ret = []
  for (const r1 of this.result) {
    for (const r2 of table) {
      let row = {}
      for (const c of Object.keys(r1)) {
        row['a.' + c] = r1[c]
      }
      for (const c of Object.keys(r2)) {
        row['b.' + c] = r2[c]
      }
      ret.push(row)
    }
  }
  this.result = ret
  return this
}

Sql.prototype.on = function (key) {
  this.result = this.result.filter(row => row['a.' + key] == row['b.' + key])
  this.result.forEach(row => {
    row[key] = row['a.' + key]
    delete row['a.' + key]
    delete row['b.' + key]
  })
  return this
}

Sql.prototype.commit = function () {
  if (!this.result)
    throw new SyntaxError('no table selected')
  if (this.cols.length === 1) {
    const arg = this.cols[0]
    if (arg === '*') {
      return this.result
    } else if (arg.toLowerCase() === 'count(*)') {
      return this.result.length
    }
  }
  return this.result.map(row => {
    let ret = {}
    for (c of this.cols) {
      ret[c] = row[c]
    }
    return ret
  })
}

module.exports = {
  select () {
    return new Sql(arguments)
  },
  student: [
    { id: 1, name: 'Alice', sex: 'f', class: 1, school: 'MA', birthday: '1999-02-19'},
    { id: 2, name: 'Bob', sex: 'm', class: 1, school: 'MA', birthday: '2000-03-16'},
    { id: 3, name: 'Jack', sex: 'm', class: 10, school: 'CS', birthday: '1998-12-23'},
    { id: 4, name: 'Jerry', sex: 'm', class: 10, school: 'CS', birthday: '1999-11-17'},
    { id: 5, name: 'Rose', sex: 'f', class: 2, school: 'MA', birthday: '1997-12-31'},
    { id: 6, name: 'Peter', sex: 'm', class: 3, school: 'ART', birthday: '1998-06-08'},
    { id: 7, name: 'Tom', sex: 'm', class: 5, school: 'EE', birthday: '2000-01-05'},
    { id: 8, name: 'Richard', sex: 'm', class: 5, school: 'EE', birthday: '1999-05-05'},
    { id: 9, name: 'Mary', sex: 'f', class: 3, school: 'ART', birthday: '1999-06-17'},
    { id: 10, name: 'Anna', sex: 'f', class: 2, school: 'MA', birthday: '1998-10-31'},
  ],
  course: [
    { id: 1, name: '数学分析' },
    { id: 2, name: '高等代数' },
    { id: 3, name: '离散数学' },
    { id: 4, name: '古典音乐鉴赏' },
    { id: 5, name: '计算机组成原理' },
    { id: 6, name: '通信原理' },
  ]
}

//const { select, course } = require('./sql')
//select('*').from(course).commit()
//select('name').from(course).where(row => row.id < 4).commit()
//select('id', 'name').from(student).orderby('name').commit()
//select('*').from(course).join(course).where(row => row['a.id'] == row['b.id']).commit()
//select('*').from(course).join(course).on('id').commit()
//select('count(*)').from(student).commit()
