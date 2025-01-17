import { defineConfig, type DefaultTheme } from 'vitepress'

export default defineConfig({
  head: [["link", { rel: "icon", href: "/ui/favicon.ico" }]],
  title: 'UI',
  base: '/ui/',
  titleTemplate: ':title - Lumin',
  description: 'A simple UI framework for Roblox',
  lastUpdated: true,
  lang: 'en-us',
  themeConfig: {
    nav: nav(),
    sidebar: {
        '/guide/': { base: '/guide/', items: guide() },
        '/api/': { base: '/api/', items: reference() },
    },

    outline: [2, 3],
	search: { provider: 'local' },
	editLink: { pattern: 'https://github.com/lumin-org/ui/edit/main/docs/:path' },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/lumin-org/ui' },
      { icon: 'discord', link: 'https://lumin-org.github.io/to/discord' },
      { icon: 'bluesky', link: 'https://lumin-org.github.io/to/bluesky' }
    ]
  }
})

function nav(): DefaultTheme.NavItem[] {
	return [
		{ text: 'Guide', link: '/guide/instances' },
		{ text: 'API', link: '/api/' },
		{ text: 'Changelog', link: '/changelog' }
	]
}

function guide(): DefaultTheme.SidebarItem[] {
	return [
		{
			text: 'Elements',
			collapsed: false,
			items: [
				{ text: 'Instances', link: 'instances' },
				{ text: 'Updates', link: 'instance-updates' },
				{ text: 'Components', link: 'components' },
			]
		},
        {
			text: 'Actions',
			collapsed: false,
			items: [
				{ text: 'Actions', link: 'actions' },
                { text: 'Events', link: 'events' },
                { text: 'Change Events', link: 'change-events' },
                { text: 'Tags', link: 'tags' },
                { text: 'Cleanup', link: 'cleanup' },
			]
		},
        {
			text: 'State',
			collapsed: false,
			items: [
                { text: 'States', link: 'states' },
				{ text: 'Computed States', link: 'computed-states' },
			]
		},
        {
			text: 'Animation',
			collapsed: false,
			items: [
                { text: 'Springs', link: 'springs' },
			]
		},
	]
}

function reference(): DefaultTheme.SidebarItem[] {
	return [
		{
			text: 'API Reference',
			items: [
				{ text: 'Aegis', base: '/', link: 'api/' },
				{
					text: 'Constructors',
					collapsed: false,
					items: [
						{ text: 'State', link: 'state' },
						{ text: 'Spring', link: 'spring' },
						{ text: 'Compute', link: 'compute' },
					]
				},
				{
					text: 'Keys',
					collapsed: false,
					base: '/api/keys',
					link: '/',
					items: [
						{ text: 'Ref', link: '/ref' },
						{ text: 'Events', link: '/events' },
						{ text: 'Changes', link: '/changes' },
						{ text: 'Cleanup', link: '/cleanup' },
						{ text: 'Attributes', link: '/attributes' },
						{ text: 'Tags', link: '/tags' }
					]
				}
			]
		},
	]
}
