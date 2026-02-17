<?php

use Illuminate\Support\Facades\Schema;

echo "Pencatatan Barang Columns: " . implode(', ', Schema::getColumnListing('pencatatan_barang')) . "\n";
echo "Pencatatan Barang Detail Columns: " . implode(', ', Schema::getColumnListing('pencatatan_barang_detail')) . "\n";
