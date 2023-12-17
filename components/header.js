class Header extends HTMLElement {
    constructor() {
      super();
    }
  
    connectedCallback() {
      this.innerHTML = `
      <title>Medical Cyber-Physical Systems at Penn</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="assets/css/bootstrap/css/bootstrap.css">
      <link rel="stylesheet" href="assets/css/style.css">
      <link rel="stylesheet" href="assets/css/header.css">
      <link rel="stylesheet" href="assets/css/font-awesome/css/font-awesome.css">
      `;
    }
  }
  
customElements.define('header-component', Header);
