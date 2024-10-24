const project_collection_name = "gtrans"
const main_search_field = "full_text"
const search_api_key = "Wlgk5iLIBsIA2nSEHlnwcX1xAXLxDjMh"  // custom search only key

const DEFAULT_CSS_CLASSES = {
    searchableInput: "form-control form-control-sm m-2 border-light-2",
    searchableSubmit: "d-none",
    searchableReset: "d-none",
    showMore: "btn btn-secondary btn-sm align-content-center",
    list: "list-unstyled",
    count: "badge m-2 badge-secondary",
    label: "d-flex align-items-center text-capitalize",
    checkbox: "m-2",
}

const typesenseInstantsearchAdapter = new TypesenseInstantSearchAdapter({
    server: {
        apiKey: search_api_key,
        nodes: [
            {
                host: "typesense.acdh-dev.oeaw.ac.at",
                port: "443",
                protocol: "https",
            },
        ],
    },
    additionalSearchParameters: {
        query_by: main_search_field,
    },
});

const searchClient = typesenseInstantsearchAdapter.searchClient;
const search = instantsearch({
    searchClient,
    indexName: project_collection_name,
    routing: {
        router: instantsearch.routers.history(),
        stateMapping: instantsearch.stateMappings.simple(),
    },
});

search.addWidgets([
    instantsearch.widgets.searchBox({
        container: "#searchbox",
        autofocus: true,
        placeholder: 'Suchen',
        cssClasses: {
            form: "form-inline",
            input: "form-control col-md-11",
            submit: "btn",
            reset: "btn",
        },
    }),

    instantsearch.widgets.hits({
        container: "#hits",
        cssClasses: {
            item: "w-100"
        },
        templates: {
            empty: "No results for <q>{{ query }}</q>",
            item(hit, { html, components }) {
                return html` 
            <h3><a href="${hit.rec_id}.html">${hit.title}</a></h3>
            <p>${hit._snippetResult.full_text.matchedWords.length > 0 ? components.Snippet({ hit, attribute: 'full_text' }) : ''}</p>`;
            },
        },
    }),

    instantsearch.widgets.pagination({
        container: "#pagination",
    }),

    instantsearch.widgets.clearRefinements({
        container: "#clear-refinements",
        templates: {
            resetLabel: "Reset filters",
        },
        cssClasses: {
            button: "btn",
        },
    }),


    instantsearch.widgets.currentRefinements({
        container: "#current-refinements",
        cssClasses: {
            delete: "btn",
            label: "badge",
        },
    }),

    instantsearch.widgets.stats({
        container: "#stats-container",

    }),


    instantsearch.widgets.configure({
        hitsPerPage: 10,
        //attributesToSnippet: [main_search_field],
        attributesToSnippet: ["full_text"],
    }),

    // FACETS

    instantsearch.widgets.panel({
        collapsed: ({ state }) => {
            return state.query.length === 0;
        },
        templates: {
            header: 'Schlagwörter',
        },
    })(instantsearch.widgets.refinementList)({
        container: "#refinement-list-keywords",
        attribute: "keywords",
        searchable: true,
        showMore: true,
        showMoreLimit: 50,
        limit: 10,
        searchablePlaceholder: "Search for Keywords",
        cssClasses: DEFAULT_CSS_CLASSES,
    }),

    instantsearch.widgets.panel({
        collapsed: ({ state }) => {
            return state.query.length === 0;
        },
        templates: {
            header: 'Art des Dokuments',
        },
    })(instantsearch.widgets.refinementList)({
        container: "#refinement-list-doctypes",
        attribute: "doctypes",
        searchable: true,
        showMore: true,
        showMoreLimit: 50,
        limit: 10,
        searchablePlaceholder: "Suche nach Dokumententypen",
        cssClasses: DEFAULT_CSS_CLASSES,
    }),

    instantsearch.widgets.panel({
        collapsed: ({ state }) => {
            return state.query.length === 0;
        },
        templates: {
            header: 'Archiv/Bibliothek',
        },
    })(instantsearch.widgets.refinementList)({
        container: "#refinement-list-repositories",
        attribute: "repositories",
        searchable: true,
        showMore: true,
        showMoreLimit: 50,
        limit: 10,
        searchablePlaceholder: "Suche nach Archiv/Bibliothek",
        cssClasses: DEFAULT_CSS_CLASSES,
    }),

    instantsearch.widgets.panel({
        collapsed: ({ state }) => {
            return state.query.length === 0;
        },
        templates: {
            header: 'Personen',
        },
    })(instantsearch.widgets.refinementList)({
        container: "#refinement-list-persons",
        attribute: "persons.label",
        searchable: true,
        showMore: true,
        showMoreLimit: 50,
        limit: 10,
        searchablePlaceholder: "Suche nach Personen",
        cssClasses: DEFAULT_CSS_CLASSES,
    }),

    instantsearch.widgets.panel({
        collapsed: ({ state }) => {
            return state.query.length === 0;
        },
        templates: {
            header: 'Orte',
        },
    })(instantsearch.widgets.refinementList)({
        container: "#refinement-list-places",
        attribute: "places.label",
        searchable: true,
        showMore: true,
        showMoreLimit: 50,
        limit: 10,
        searchablePlaceholder: "Suche nach Orte",
        cssClasses: DEFAULT_CSS_CLASSES,
    }),

    instantsearch.widgets.panel({
        collapsed: ({ state }) => {
            return state.query.length === 0;
        },
        templates: {
            header: 'Institution',
        },
    })(instantsearch.widgets.refinementList)({
        container: "#refinement-list-orgs",
        attribute: "orgs.label",
        searchable: true,
        showMore: true,
        showMoreLimit: 50,
        limit: 10,
        searchablePlaceholder: "Suche nach Institution",
        cssClasses: DEFAULT_CSS_CLASSES,
    }),

    // instantsearch.widgets.panel({
    //     collapsed: ({ state }) => {
    //         return state.query.length === 0;
    //     },
    //     templates: {
    //         header: 'Terms',
    //     },
    // })(instantsearch.widgets.refinementList)({
    //     container: "#refinement-list-term",
    //     attribute: "term",
    //     searchable: true,
    //     showMore: true,
    //     showMoreLimit: 50,
    //     limit: 10,
    //     searchablePlaceholder: "Search for terms",
    //     cssClasses: DEFAULT_CSS_CLASSES,
    // }),

]);




search.start();