const { addonBuilder } = require("stremio-addon-sdk");

const manifest = {
    "id": "org.stremio.helloworld",
    "version": "1.0.0",

    "name": "One Pace Addon",
    "description": "One Pace addon for Stremio",

    //"icon": "URL to 256x256 monochrome png icon", 
    //"background": "URL to 1024x786 png/jpg background",

    "resources": [
        "catalog",
        {
            "name": "meta",
            "types": ["series"],
            "idPrefixes": ["pp"]
        },
        "stream"
    ],

    "types": ["series"], // your add-on will be preferred for these content types

    "catalogs": [
        {
            type: 'series',
            id: 'top',
            "extra": [
                { "name": "skip", "isRequired": false },
                { "name": "search", "isRequired": false },
            ]
        }
    ],

};



const builder = new addonBuilder(manifest);

function getMovieMeta(id) {
    const metas = {
        "pp_onepace": {
            id: "pp_onepace",
            type: "series",
            name: "One Pace",
            poster: "https://i.pinimg.com/originals/eb/85/c4/eb85c4376b474030b80afa80ad1cd13a.jpg",
            genres: ["Animation", "Comedy"],
            description: "One Piece but better",
            cast: ["Luffy, Nami, Zoro, etc"],
            director: ["Toei Animation"],
            logo: "https://i0.wp.com/onepace.watch/wp-content/uploads/2022/03/onepace-e1647957355458.png",
            background: "https://wallpaperaccess.com/full/17350.jpg",
            runtime: "Very long"
        },
    }
    Promise.resolve(metas[id] || null)
}

builder.defineMetaHandler(({ type, id }) => {
    // Docs: https://github.com/Stremio/stremio-addon-sdk/blob/master/docs/api/requests/defineMetaHandler.md
    let results;

    switch (type) {
        case 'series':
            results = getMovieMeta(id)
            break
        default:
            results = null
            break
    }
    return Promise.resolve({ meta: results })
})

function getSeriesStreams(id) {
    const streams = {
        pp_onepace: [
            { "title": "Web, 3 MBps, HD", "url": "http://jell.yfish.us/media/jellyfish-3-mbps-hd-h264.mkv" },
            { "title 2": "Web 15 MBps, HD", "url": "http://jell.yfish.us/media/jellyfish-15-mbps-hd-h264.mkv" },
            { "title 3": "Web, 120 MBps, 4K", "url": "http://jell.yfish.us/media/jellyfish-120-mbps-4k-uhd-h264.mkv" }
        ]
    }
    return Promise.resolve(streams[id] || [])
}

builder.defineStreamHandler(({ type, id }) => {
    // Docs: https://github.com/Stremio/stremio-addon-sdk/blob/master/docs/api/requests/defineStreamHandler.md
    let results;

    switch (type) {
        case 'series':
            results = getSeriesStreams(id)
            break
        default:
            results = Promise.resolve([])
            break
    }
    return results.then(streams => ({ streams }))
})

// Populate the catalog from somewhere
function getSeriesCatalog(catalogName) {
    let catalog;

    switch (catalogName) {
        case "top":
            catalog = [
                {
                    id: "pp_onepace",
                    type: "series",
                    name: "One Pace",
                    poster: "https://i.pinimg.com/originals/eb/85/c4/eb85c4376b474030b80afa80ad1cd13a.jpg",
                    genres: ["Animation", "Comedy"]
                }
            ]
            break
        default:
            catalog = []
            break
    }

    return Promise.resolve(catalog)
}

// Docs: https://github.com/Stremio/stremio-addon-sdk/blob/master/docs/api/requests/defineCatalogHandler.md
builder.defineCatalogHandler(({ type, id, extra }) => {
    let results;

    switch (type) {
        case "series":
            results = getSeriesCatalog(id)
            break
        default:
            results = Promise.resolve([])
            break
    }
    if (extra.search) {
        return results.then(items => ({
            metas: items.filter(meta => meta.name
                .toLowercase()
                .includes(extra.search.toLowerCase()))
        }))
    }

    const skip = extra.skip || 0;
    return results.then(items => ({
        metas: items.slice(skip, skip + 100)
    }))
})

/*const dataset = {
    // Some examples of streams we can serve back to Stremio ; see https://github.com/Stremio/stremio-addon-sdk/blob/master/docs/api/responses/stream.md
    "tt9998999:1:1": { name: "One Pace", type: "series", infoHash: "1ef273f42db2c163f28c1a740498281a571e3604" }, // torrent for season 1, episode 1
    "tt9998999:1:2": { name: "One Pace", type: "series", infoHash: "b5a0d39d7b1eda73ccb3d70ddfa608e7834b84ce" },
};

// Streams handler
builder.defineStreamHandler(function(args) {
    if (dataset[args.id]) {
        return Promise.resolve({ streams: [dataset[args.id]] });
    } else {
        return Promise.resolve({ streams: [] });
    }
})

const METAHUB_URL = "https://images.metahub.space"

const generateMetaPreview = function(value, key) {
    // To provide basic meta for our movies for the catalog
    // we'll fetch the poster from Stremio's MetaHub
    // see https://github.com/Stremio/stremio-addon-sdk/blob/master/docs/api/responses/meta.md#meta-preview-object
    const imdbId = key.split(":")[0]
    return {
        id: imdbId,
        type: value.type,
        name: value.name,
        poster: "https://i.pinimg.com/originals/eb/85/c4/eb85c4376b474030b80afa80ad1cd13a.jpg",
    }
}

builder.defineCatalogHandler(function(args, cb) {
    // filter the dataset object and only take the requested type
    const metas = Object.entries(dataset)
        .filter(([_, value]) => value.type === args.type)
        .map(([key, value]) => generateMetaPreview(value, key))

    return Promise.resolve({ metas: metas })
})*/

module.exports = builder.getInterface()