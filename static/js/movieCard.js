function generateMovieCard(movieName, imagePath) {

    if (imagePath == null) {
        imagePath = `"./media/pics/${movieName}.jpg"`;
    }

    // const imageFromTheInternet = await getImage(movieName);
    // const defaultImagePath = `"${imageFromTheInternet}"` || `"./media/default-movie.png"`;

    const defaultImagePath = `"./media/default-movie.png"`;

    return `
        <div class="movie-card">
            <div class="movie-header" style='background-image: url(${defaultImagePath});'>
                <div class="movie-header" style='background-image: url(${imagePath});'>
                
                </div><!--movie-header-->
            </div><!--movie-header-->
            <div class="movie-content">
                <div class="movie-content-header">
                    <a href="#">
                        <h3 class="movie-title">${movieName}</h3>
                    </a>
                </div>
                <div class="movie-info">
                    <div class="info-section">
                        <label>Rating</label>
                        <span>9/10</span>
                    </div>
                </div>
            </div>
        </div>
    `;
}

function getImage(keyword = "matrix") {
    return new Promise((resolve, reject) => {
        $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
        {
            tags: keyword + " movie",
            tagmode: "any",
            format: "json"
        },
        function(data) {
            const rnd = Math.floor(Math.random() * data.items.length);
            const image_src = data.items[rnd]['media']['m'].replace("_m", "_b");
            resolve(image_src);
        });
    })
}

function checkImage(imageSrc) {
    const img = new Image();
    return new Promise((resolve) => {
        img.onload = () => resolve(true);
        img.onerror = () => resolve(false);
        img.src = imageSrc;
    });
}