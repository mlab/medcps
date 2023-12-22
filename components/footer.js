class Footer extends HTMLElement {
    constructor() {
      super();
    }
  
    connectedCallback() {
      this.innerHTML = `
      <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4 md-margin-bottom-40">
                <div class="headline"><h2>About</h2></div>	
            <p class="margin-bottom-25 md-margin-bottom-40">The Medical Cyber-Physical System research in Penn is part of the <a href="http://precise.seas.upenn.edu/" target="_blank">PRECISE research group</a>.</p>	
          </div>
          
          <div class="col-md-4">
                <div class="headline"><h2>Contact</h2></div>	
                    <address class="md-margin-bottom-40">
                        University of Pennsylvania<br />
                        Levine building room 279<br />
                        3330 Walnut Street<br />
                        Philadelphia, PA, 19104<br />
                        Email: rahulm@seas.upenn.edu
                    </address>
          </div>
        </div>
      </div>
      </div>
      
      <div class="copyright">
        <div class="container">
          <div class="row">
            <div class="col-md-6">						
              <p class="copyright-space">&copy; MedCPS ALL Rights Reserved.</p>
            </div>
            <div class="col-md-6">	
              <a href="http://precise.seas.upenn.edu/">
                <img src="assets/img/precise.png" alt="" height="50" class="pull-right" id="logo-footer"/>
              </a>
            </div>
          </div>
        </div>
      </div>
      `;
    }
  }
  
customElements.define('footer-component', Footer);
