export class User {
  name = $state('Diego');

  constructor(name) {
    this.name = name;
  }

  changeName(name) {
    this.name = name;
  }
}