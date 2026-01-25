<header class="bg-background sticky inset-x-0 top-0 isolate flex shrink-0 items-center gap-2 border-b z-10">
    <div class="flex h-14 w-full items-center gap-2 px-4">
        <button type="button" onclick="document.dispatchEvent(new CustomEvent('basecoat:sidebar'))"
            aria-label="Toggle sidebar" data-tooltip="Toggle sidebar" data-side="bottom" data-align="start"
            class="btn-sm-icon-ghost mr-auto size-7 -ml-1.5">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <rect width="18" height="18" x="3" y="3" rx="2"></rect>
                <path d="M9 3v18"></path>
            </svg>
        </button>
        <script>
            (() => {
                const themeSelect = document.getElementById('theme-select');
                const storedTheme = localStorage.getItem('themeVariant');
                if (themeSelect && storedTheme) themeSelect.value = storedTheme;
                themeSelect.addEventListener('change', () => {
                    const newTheme = themeSelect.value;
                    document.documentElement.classList.forEach(c => {
                        if (c.startsWith('theme-')) document.documentElement.classList.remove(c);
                    });
                    if (newTheme) {
                        document.documentElement.classList.add(`theme-${newTheme}`);
                        localStorage.setItem('themeVariant', newTheme);
                    } else {
                        localStorage.removeItem('themeVariant');
                    }
                });
            })();
        </script>

        <button type="button" aria-label="Toggle dark mode" data-tooltip="Toggle dark mode" data-side="bottom"
            onclick="document.dispatchEvent(new CustomEvent('basecoat:theme'))" class="btn-icon-outline size-8">
            <span class="hidden dark:block"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                    stroke-linejoin="round">
                    <circle cx="12" cy="12" r="4"></circle>
                    <path d="M12 2v2"></path>
                    <path d="M12 20v2"></path>
                    <path d="m4.93 4.93 1.41 1.41"></path>
                    <path d="m17.66 17.66 1.41 1.41"></path>
                    <path d="M2 12h2"></path>
                    <path d="M20 12h2"></path>
                    <path d="m6.34 17.66-1.41 1.41"></path>
                    <path d="m19.07 4.93-1.41 1.41"></path>
                </svg></span>
            <span class="block dark:hidden"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                    stroke-linejoin="round">
                    <path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"></path>
                </svg></span>
        </button>
        <div id="demo-dropdown-menu" class="dropdown-menu">
          <button type="button" id="demo-dropdown-menu-trigger" aria-haspopup="menu" aria-controls="demo-dropdown-menu-menu" aria-expanded="false" class="btn-outline">
            <i class="fa-solid fa-user"></i>
            {{ auth()->user()->name }}
          </button>
          <div id="demo-dropdown-menu-popover" data-popover data-align="end" aria-hidden="true" class="min-w-56">
            <div role="menu" id="demo-dropdown-menu-menu" aria-labelledby="demo-dropdown-menu-trigger">
              <div role="group" aria-labelledby="account-options">
                <div role="heading" id="account-options">Akun Saya</div>
                <a href="{{ route('profile.edit') }}" role="menuitem" class="block cursor-pointer">
                  Profil
                </a>
              </div>
              <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" role="menuitem" class="w-full text-left cursor-pointer">
                  Logout
                </button>
              </form>
            </div>
          </div>
        </div>

    </div>
</header>