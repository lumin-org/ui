import { defineConfig, type DefaultTheme } from "vitepress";
import { tabsMarkdownPlugin } from "vitepress-plugin-tabs";

export default defineConfig({
  head: [["link", { rel: "icon", href: "/ui/favicon.ico" }]],
  title: "UI",
  base: "/ui/",
  titleTemplate: ":title - Lumin",
  description: "A simple UI framework for Roblox",
  lastUpdated: true,
  lang: "en-us",
  markdown: {
    config(md) {
      md.use(tabsMarkdownPlugin);
    },
  },
  themeConfig: {
    nav: nav(),
    sidebar: {
      "/guide/": { base: "/guide/", items: guide() },
      "/api/": { base: "/api/", items: reference() },
    },

    outline: [2, 3],
    search: { provider: "local" },
    editLink: {
      pattern: "https://github.com/lumin-org/ui/edit/main/docs/:path",
    },

    socialLinks: [
      { icon: "github", link: "https://github.com/lumin-org/ui" },
      { icon: "discord", link: "https://lumin-org.github.io/to/discord" },
      { icon: "bluesky", link: "https://lumin-org.github.io/to/bluesky" },
    ],
  },
});

function nav(): DefaultTheme.NavItem[] {
  return [
    { text: "Guide", link: "/guide/introduction" },
    { text: "API", link: "/api/" },
    { text: "Changelog", link: "/changelog" },
  ];
}

function guide(): DefaultTheme.SidebarItem[] {
  return [
    {
      text: "Getting Started",
      collapsed: false,
      items: [
        { text: "Introduction", link: "introduction" },
        { text: "Installation", link: "installation" },
      ],
    },
    {
      text: "Elements",
      collapsed: false,
      items: [
        { text: "Instances", link: "instances" },
        { text: "Views", link: "views" },
        { text: "Updates", link: "instance-updates" },
        { text: "Components", link: "components" },
      ],
    },
    {
      text: "Actions",
      collapsed: false,
      items: [
        { text: "Actions", link: "actions" },
        { text: "Events", link: "events" },
        { text: "Change Events", link: "change-events" },
        { text: "Tags", link: "tags" },
        { text: "Cleanup", link: "cleanup" },
        { text: "For Each", link: "for-each" },
      ],
    },
    {
      text: "State",
      collapsed: false,
      items: [
        { text: "States", link: "states" },
        { text: "Computed States", link: "computed-states" },
      ],
    },
    {
      text: "Animation",
      collapsed: false,
      items: [{ text: "Springs", link: "springs" }],
    },
    {
      text: "Errors",
      collapsed: true,
      items: [
        { text: "Unused Spring", link: "errors#springnotused" },
        { text: "Invalid Damping", link: "errors#springinvaliddamping" },
        { text: "Invalid Speed", link: "errors#springinvalidspeed" },
        { text: "Not Animatable", link: "errors#springnotanimatable" },
        { text: "Invalid Type", link: "errors#invalidtype" },
        { text: "Invalid Class", link: "errors#invalidclass" },
        { text: "Invalid Prop", link: "errors#invalidprop" },
        { text: "Invalid Event", link: "errors#invalidevent" },
        { text: "Cannot Clean", link: "errors#cleanupcannotclean" },
        { text: "ForEach Invalid Return", link: "errors#foreachinvalidreturn" },
        { text: "View Invalid Type", link: "errors#viewinvalidtype" },
        { text: "Invalid Key Type", link: "errors#applyinvalidkeytype" },
        { text: "Invalid Prop Type", link: "errors#applyinvalidproptype" },
      ],
    },
  ];
}

function reference(): DefaultTheme.SidebarItem[] {
  return [
    {
      items: [
        { text: "UI", link: "/" },
        { text: "Spring", link: "spring" },
        { text: "State", link: "state" },
        { text: "Compute", link: "compute" },
      ],
    },
  ];
}
