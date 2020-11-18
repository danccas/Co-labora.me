    <div class="header-container">
      <a href="#" data-target="nav-mobile">
        <i class="material-icons">menu</i>
      </a>
    </div>
    <ul id="nav-mobile" class="sidenav hide">
        <li class="logo">
          <a id="logo-container" href="/" class="brand-logo">
            #Yo<br />Apoyo
          </a>
        </li>
<?php if(Identify::g()->id !== null) { ?>
        <li class="info">
          Bienvenid@, <b><?= Identify::g()->data['usuario']['nombres'] ?></b>
        </li>
        <li class="saldo">
          <div id="UserAmount">Saldo: S/. <?= Identify::g()->data['usuario']['monto'] ?></div>
        </li>
        <li class="bold"><a href="/" class="waves-effect waves-teal">Inicio</a></li>
        <li class="bold"><a href="/recaudaciones" class="waves-effect waves-teal">Mis Recaudaciones</a></li>
        <li class="bold"><a href="/transferencias" class="waves-effect waves-teal">Mis Transferencias</a></li>
        <li class="bold"><a href="/identificacion?out" class="waves-effect waves-teal">Cerrar Sesión</a></li>
<?php } else { ?>
        <li class="info">
          Bienvenid@, <b>Invitado</b>
        </li>
        <li class="saldo">
          <div>Saldo: S/. 0.00</div>
        </li>
<?php } ?>
    </ul>
