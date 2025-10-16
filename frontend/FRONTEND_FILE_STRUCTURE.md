# Frontend File Structure (Generated)

frontend/
├── Dockerfile
├── middleware.ts
├── next-env.d.ts
├── next.config.mjs
├── package.json
├── postcss.config.mjs
├── tsconfig.json
├── app/
│   ├── error.tsx
│   ├── globals.css
│   ├── layout.tsx
│   ├── not-found.tsx
│   ├── page.tsx
│   ├── about/page.tsx
│   ├── actions/
│   │   ├── admin.ts
│   │   ├── exchange.ts
│   │   ├── kyc.ts
│   │   ├── reserves.ts
│   │   ├── transactions.ts
│   │   └── wallet.ts
│   ├── admin/
│   │   ├── page.tsx
│   │   ├── exchange-rates/page.tsx
│   │   ├── kyc/page.tsx
│   │   ├── manage-news/page.tsx
│   │   ├── reserves/page.tsx
│   │   ├── transactions/page.tsx
│   │   └── users/page.tsx
│   ├── api/
│   │   ├── init-db/route.ts
│   │   ├── setup-db/route.ts
│   │   ├── auth/logout/route.ts
│   │   ├── cron/update-gold-price/route.ts
│   │   ├── cron/update-rates/route.ts
│   │   └── wallet/create/route.ts
│   ├── auth/
│   │   ├── login/page.tsx
│   │   ├── sign-up/page.tsx
│   │   └── sign-up-success/page.tsx
│   ├── contact/page.tsx
│   ├── converter/page.tsx
│   ├── currency/page.tsx
│   ├── dashboard/page.tsx
│   ├── exchange/page.tsx
│   ├── faq/page.tsx
│   ├── kyc/page.tsx
│   ├── news/
│   │   ├── [id]/page.tsx
│   │   └── page.tsx
│   ├── profile/page.tsx
│   ├── send/page.tsx
│   ├── settings/page.tsx
│   ├── setup-db/page.tsx
│   ├── transactions/page.tsx
│   └── wallet/page.tsx
├── components/
│   ├── admin-nav-bar.tsx
│   ├── animated-counter.tsx
│   ├── contact-form.tsx
│   ├── currency-converter.tsx
│   ├── currency-ticker.tsx
│   ├── exchange-rates-table.tsx
│   ├── footer.tsx
│   ├── forex-rate-display.tsx
│   ├── kyc-status-card.tsx
│   ├── kyc-upload-form.tsx
│   ├── live-rate-card.tsx
│   ├── market-stats.tsx
│   ├── nav-bar.tsx
│   ├── send-form.tsx
│   ├── send-money-form.tsx
│   ├── theme-provider.tsx
│   ├── transaction-list.tsx
│   ├── wallet-card.tsx
│   ├── Admin/
│   │   ├── AdminDashboard.tsx
│   │   ├── stats-card.tsx
│   │   └── user-table.tsx
│   ├── Currency/
│   │   ├── CurrencyCard.tsx
│   │   ├── CurrencyChart.tsx
│   │   └── CurrencyConverter.tsx
│   ├── FAQ/
│   │   ├── FAQItem.tsx
│   │   └── FAQList.tsx
│   ├── Layout/
│   │   ├── Header.tsx
│   │   └── Navigation.tsx
│   ├── Transaction/
│   │   ├── TransactionForm.tsx
│   │   └── TransactionItem.tsx
│   └── UI/
│       ├── Chart.tsx
│       ├── LoadingSpinner.tsx
│       ├── accordion.tsx
│       ├── alert.tsx
│       ├── avatar.tsx
│       ├── badge.tsx
│       ├── button.tsx
│       ├── card.tsx
│       ├── dropdown-menu.tsx
│       ├── input.tsx
│       ├── label.tsx
│       ├── select.tsx
│       ├── sonner.tsx
│       ├── switch.tsx
│       ├── table.tsx
│       ├── textarea.tsx
│       └── toast.tsx
├── hooks/
│   └── use-toast.ts
├── lib/
│   ├── utils.ts
│   ├── contexts/
│   │   ├── CurrencyContext.tsx
│   │   ├── ThemeContext.tsx
│   │   ├── TransactionContext.tsx
│   │   ├── auth-context.tsx
│   │   └── wallet-context.tsx
│   ├── db/
│   │   └── queries.ts
│   ├── hooks/
│   │   ├── use-currency.ts
│   │   ├── useAuth.ts
│   │   ├── useDebounce.ts
│   │   ├── useLocalStorage.ts
│   │   ├── useTheme.ts
│   │   ├── useTransaction.ts
│   │   └── useWallet.ts
│   ├── routes/
│   │   ├── AdminRoute.tsx
│   │   ├── ProtectedRoute.tsx
│   │   └── index.ts
│   ├── services/
│   │   ├── act-price-service.ts
│   │   ├── api.ts
│   │   ├── authService.ts
│   │   ├── countryService.ts
│   │   ├── currencyService.ts
│   │   ├── exchange-rate-service.ts
│   │   ├── gold-price-service.ts
│   │   ├── newsService.ts
│   │   ├── notification-service.ts
│   │   ├── transactionService.ts
│   │   ├── userService.ts
│   │   └── walletService.ts
│   ├── stellar/
│   │   ├── client.ts
│   │   ├── config.ts
│   │   ├── encryption.ts
│   │   ├── transactions.ts
│   │   └── wallet.ts
│   ├── supabase/
│   │   ├── client.ts
│   │   ├── middleware.ts
│   │   └── server.ts
│   ├── types/
│   │   ├── api.ts
│   │   ├── components.ts
│   │   ├── database.ts
│   │   ├── index.ts
│   │   └── stellar.ts
│   └── utils/
│       ├── constants.ts
│       ├── format.ts
│       ├── formatters.ts
│       ├── helpers.ts
│       └── validators.ts
├── public/
│   ├── favicon.jpg
│   ├── index.html
│   ├── logo.jpg
│   ├── manifest.json
│   ├── placeholder-logo.png
│   ├── placeholder-logo.svg
│   ├── placeholder-user.jpg
│   ├── placeholder.jpg
│   ├── placeholder.svg
│   ├── robots.txt
│   ├── flags/
│   │   ├── egypt.jpg
│   │   ├── ethiopia.jpg
│   │   ├── ghana.jpg
│   │   ├── kenya.jpg
│   │   ├── morocco.jpg
│   │   ├── nigeria.jpg
│   │   ├── south-africa.jpg
│   │   ├── tanzania.jpg
│   │   └── uganda.jpg
│   ├── fonts/
│   │   ├── Roboto-Bold.ttf
│   │   ├── Roboto-Light.ttf
│   │   ├── Roboto-Medium.ttf
│   │   └── Roboto-Regular.ttf
│   ├── icons/
│   │   ├── currency.jpg
│   │   ├── news.jpg
│   │   ├── settings.jpg
│   │   ├── transaction.jpg
│   │   ├── user.jpg
│   │   └── wallet.jpg
│   └── images/
│       ├── logo.jpg
│       ├── logo192.jpg
│       ├── logo512.jpg
│       ├── flags/
│       │   ├── algeria.jpg
│       │   ├── egypt.jpg
│       │   ├── ethiopia.jpg
│       │   ├── ghana.jpg
│       │   ├── kenya.jpg
│       │   ├── morocco.jpg
│       │   ├── nigeria.jpg
│       │   ├── rwanda.jpg
│       │   ├── south-africa.jpg
│       │   ├── tanzania.jpg
│       │   ├── tunisia.jpg
│       │   ├── uganda.jpg
│       │   ├── zambia.jpg
│       │   └── zimbabwe.jpg
│       └── icons/
│           ├── chart.jpg
│           ├── currency.jpg
│           ├── exchange.jpg
│           ├── news.jpg
│           ├── notification.jpg
│           ├── receive.jpg
│           ├── security.jpg
│           ├── send.jpg
│           ├── settings.jpg
│           ├── transaction.jpg
│           ├── user.jpg
│           └── wallet.jpg
└── styles/
    ├── globals.css
    ├── main.css
    ├── mixins.css
    └── variables.css
