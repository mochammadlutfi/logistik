<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ config('app.name', 'Laravel') }}</title>
        @vite(['resources/css/app.css', 'resources/js/app.js'])
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fluentui/font-icons-mdl2@latest/css/font-icons.min.css" />
        {{-- <link rel="stylesheet" href="https://cdn.datatables.net/2.3.5/css/dataTables.tailwindcss.css"> --}}
        <link rel="stylesheet" href="{{ asset('js/datatables/datatables.css') }}">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        
        {{-- BasecoatUI JavaScript --}}
        <script src="https://cdn.jsdelivr.net/npm/basecoat-css@0.3.10-beta.2/dist/js/basecoat.min.js" defer></script>
        <script src="https://cdn.jsdelivr.net/npm/basecoat-css@0.3.10-beta.2/dist/js/select.min.js" defer></script>
    </head>
    <body
        x-data="{ page: 'dashboard', loaded: true, darkMode: false, stickyMenu: false, sidebarToggle: false, scrollTop: false }"
        x-init="darkMode = JSON.parse(localStorage.getItem('darkMode')); $watch('darkMode', value => localStorage.setItem('darkMode', JSON.stringify(value)))"
        :class="{'dark bg-gray-900': darkMode === true}"
    >
        @include('layouts.partials.sidebar')    

        <main>
            @include('layouts.partials.header')
            {{ $slot }}
        </main>

        <!-- ===== Page Wrapper End ===== -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        {{-- <script src="https://cdn.datatables.net/2.3.5/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.3.5/js/dataTables.tailwindcss.js"></script> --}}
        <script src="{{ asset('js/datatables/datatables.js') }}"></script>
        <script src="{{ asset('js/datatables/datatables-tailwindcss.js') }}"></script>
        {{-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@9.0.3"></script>
        <script>
            const dataTable = new simpleDatatables.DataTable("#default-table");
        </script> --}}
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script>
            $(".datepicker").flatpickr({
                altInput: true,
                altFormat: "d F Y",
                dateFormat: "Y-m-d",
                defaultDate: "today",
            });

        </script>
        @stack('scripts')
    </body>
</html>
