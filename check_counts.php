<?php

use App\Models\Gudang;
use App\Models\User;
use App\Models\Barang;
use App\Models\Supplier;

echo "Gudang Count: " . Gudang::count() . "\n";
echo "User Count: " . User::count() . "\n";
echo "Barang Count: " . Barang::count() . "\n";
echo "Supplier Count: " . Supplier::count() . "\n";

$gudangs = Gudang::all()->pluck('id')->toArray();
echo "Gudang IDs: " . implode(', ', $gudangs) . "\n";
