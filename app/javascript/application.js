// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import './src/jquery'
import "./controllers"
import * as bootstrap from "bootstrap"
import 'admin-lte/dist/js/adminlte.js'
import select2 from 'select2/dist/js/select2.js';
window.select2 = select2();
