@props(['items', 'selected' => null])

<div id="select-gudang" class="select">
    <button type="button" class="btn-outline justify-between font-normal w-full" id="select-gudang-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-gudang-listbox">
        <span class="truncate">
            @if($selected)
                @php
                    $selectedBase = $items->firstWhere('id', $selected);
                @endphp
                {{ $selectedBase ? $selectedBase->nama_gudang : 'Pilih Gudang...' }}
            @else
                Pilih Gudang...
            @endif
        </span>

        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
        <path d="m7 15 5 5 5-5" />
        <path d="m7 9 5-5 5 5" />
        </svg>
    </button>
    <div id="select-gudang-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
        <header>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
            <circle cx="11" cy="11" r="8" />
            <path d="m21 21-4.3-4.3" />
        </svg>
        <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-gudang-listbox" aria-labelledby="select-gudang-trigger" />
        </header>

        <div role="listbox" id="select-gudang-listbox" aria-orientation="vertical" aria-labelledby="select-gudang-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
        <div role="group" aria-labelledby="group-label-select-gudang-items-1">
            <div role="heading" id="group-label-select-gudang-items-1">Gudang</div>

            @foreach ($items as $item)
            <div id="select-gudang-items-1-{{ $item->id }}" role="option" data-value="{{ $item->id }}" {{ $selected == $item->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $item->nama_gudang }}">
                {{ $item->nama_gudang }}
            </div>
            @endforeach
        </div>
        </div>
    </div>
    <input type="hidden" name="gudang_id" value="{{ $selected }}" />
</div>
