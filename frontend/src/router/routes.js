
const routes = [
  {
    path: '/',
    component: () => import('layouts/MyLayout.vue'),
    children: [
      { path: '', component: () => import('pages/Index.vue') },
      {
        path: '/qr-code-scanner',
        component: () => import('pages/QRCodeScanner.vue')
      },
      {
        path: '/cigarette-butts-detector',
        component: () => import('pages/CigaretteButtsDetector.vue')
      }
    ]
  }
]

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('pages/Error404.vue')
  })
}

export default routes
