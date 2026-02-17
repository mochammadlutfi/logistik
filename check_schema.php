<?php

use Illuminate\Support\Facades\Schema;

echo "Transfer Barang Columns: " . implode(', ', Schema::getColumnListing('transfer_barang')) . "\n";
echo "Transfer Barang Detail Columns: " . implode(', ', Schema::getColumnListing('transfer_barang_detail')) . "\n";
echo "Pemeliharaan Barang Columns: " . implode(', ', Schema::getColumnListing('pemeliharaan_barang')) . "\n";
echo "Pemeliharaan Barang Detail Columns: " . implode(', ', Schema::getColumnListing('pemeliharaan_barang_detail')) . "\n";
