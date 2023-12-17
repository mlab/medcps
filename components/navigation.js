class Navigation extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    this.innerHTML = `
    <div class="header">
    <div class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html"><img id="logo-header" src="assets/img/logo.png" alt="Logo"></a>
            </div>

            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown active"><a href="index.html">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Research<i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="patient_specific_heart_modeling.html">Patient-specific Heart Modeling</a></li>
                            <li><a href="fiber_effect.html">Myocardial Fiber Effects on Arrhythmia Activation Patterns</a></li>
                            <li><a href="VHM.html">Heart Modeling for Closed-loop Evaluation of Pacemakers</a></li>
                            <li><a href="verification.html">Pacemaker Software Verification</a></li>
                            <li><a href="MBD.html">Model-based Design for Medical Device Software</a></li>
                            <li><a href="MBCT.html">Computer-Aided Clinical Trials</a></li>
                            <li><a href="physiology.html">Physiological Control Systems</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="publications.html">Publications</a></li>
                    <li class="dropdown"><a href="people.html">People</a></li>
                    <li class="dropdown"><a href="awards.html">Awards</a></li>
                    <li class="dropdown"><a href="downloads.html">Downloads</a></li>
                    </li><li class="dropdown"><a href="faq.html">FAQ</a></li>
                </ul>
            </div>
        </div>
    </div>
    </div>
    `;
  }
}

customElements.define('navigation-component', Navigation);
