import './bootstrap';

import Alpine from 'alpinejs';
import persist from '@alpinejs/persist';
import 'basecoat-css/all';
// import { DataTable } from "simple-datatables";

// window.DataTable = new DataTable("#default-table");
Alpine.plugin(persist);
window.Alpine = Alpine;
Alpine.start();
