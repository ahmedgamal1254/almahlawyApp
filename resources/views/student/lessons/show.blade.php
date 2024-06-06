@extends("student.layouts.master")

@section("title")
فيديو {{ $lesson->title }}
@endsection

@section("content")
<div class="home-page">
    <div class="container">
        <div class="row">
            <div class="col-xl-12 col-lg-12">
                <div class="coures-content">
                    <div class="course-details">
                        <div href="#" class="course-lesson-head">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24"/>
                                    <path d="M9.82866499,18.2771971 L16.5693679,12.3976203 C16.7774696,12.2161036 16.7990211,11.9002555 16.6175044,11.6921539 C16.6029128,11.6754252 16.5872233,11.6596867 16.5705402,11.6450431 L9.82983723,5.72838979 C9.62230202,5.54622572 9.30638833,5.56679309 9.12422426,5.7743283 C9.04415337,5.86555116 9,5.98278612 9,6.10416552 L9,17.9003957 C9,18.1765381 9.22385763,18.4003957 9.5,18.4003957 C9.62084305,18.4003957 9.73759731,18.3566309 9.82866499,18.2771971 Z" fill="#000000"/>
                                </g>
                            </svg>

                            <p class="course-lesson-title"> {{ $lesson->description }}
                            </p>
                        </div>

                        <div class="course-check-text">

                        </div>
                    </div>

                    <div class="video-container paused " data-volume-level="high">
                        <img class="thumbnail-img">
                        <div class="video-controls-container">
                            <div class="timeline-container">
                                <div class="timeline">
                                    <img class="preview-img">
                                    <div class="thumb-indicator"></div>
                                </div>
                            </div>

                            <div class="controls">
                                <button class="play-pause-btn">
                                    <svg class="play-icon" viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M8,5.14V19.14L19,12.14L8,5.14Z" />
                                    </svg>
                                    <svg class="pause-icon" viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M14,19H18V5H14M6,19H10V5H6V19Z" />
                                    </svg>
                                </button>

                                <div class="volume-container">
                                    <button class="mute-btn">
                                        <svg class="volume-high-icon" viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M14,3.23V5.29C16.89,6.15 19,8.83 19,12C19,15.17 16.89,17.84 14,18.7V20.77C18,19.86 21,16.28 21,12C21,7.72 18,4.14 14,3.23M16.5,12C16.5,10.23 15.5,8.71 14,7.97V16C15.5,15.29 16.5,13.76 16.5,12M3,9V15H7L12,20V4L7,9H3Z" />
                                        </svg>
                                        <svg class="volume-low-icon" viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M5,9V15H9L14,20V4L9,9M18.5,12C18.5,10.23 17.5,8.71 16,7.97V16C17.5,15.29 18.5,13.76 18.5,12Z" />
                                        </svg>
                                        <svg class="volume-muted-icon" viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M12,4L9.91,6.09L12,8.18M4.27,3L3,4.27L7.73,9H3V15H7L12,20V13.27L16.25,17.53C15.58,18.04 14.83,18.46 14,18.7V20.77C15.38,20.45 16.63,19.82 17.68,18.96L19.73,21L21,19.73L12,10.73M19,12C19,12.94 18.8,13.82 18.46,14.64L19.97,16.15C20.62,14.91 21,13.5 21,12C21,7.72 18,4.14 14,3.23V5.29C16.89,6.15 19,8.83 19,12M16.5,12C16.5,10.23 15.5,8.71 14,7.97V10.18L16.45,12.63C16.5,12.43 16.5,12.21 16.5,12Z" />
                                        </svg>
                                    </button>

                                    <input class="volume-slider" type="range" min="0" max="1" step="any" value="1">
                                </div>

                                <div class="duration-container">
                                    <div class="current-time">0:00</div>
                                    /
                                    <div class="total-time">10:00</div>
                                </div>

                                <button class="speed-btn wide-btn">1x</button>

                                <button class="mini-player-btn">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M21 3H3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h18c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H3V5h18v14zm-10-7h9v6h-9z" />
                                    </svg>
                                </button>

                                <button class="theater-btn">
                                    <svg class="tall" viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 6H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm0 10H5V8h14v8z" />
                                    </svg>
                                    <svg class="wide" viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 7H5c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V9c0-1.1-.9-2-2-2zm0 8H5V9h14v6z" />
                                    </svg>
                                </button>

                                <button class="full-screen-btn">
                                    <svg class="open" viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M7 14H5v5h5v-2H7v-3zm-2-4h2V7h3V5H5v5zm12 7h-3v2h5v-5h-2v3zM14 5v2h3v3h2V5h-5z" />
                                    </svg>
                                    <svg class="close" viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M5 16h3v3h2v-5H5v2zm3-8H5v2h5V5H8v3zm6 11h2v-3h3v-2h-5v5zm2-11V5h-2v5h5V8h-3z" />
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <video src="{{ asset("public/app/vidoes/".$lesson->video_url) }}"
                            poster="{{ asset("publi/app/".$lesson->img_caption) }}"></video>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section("title_script")
<style>
.video-container{
    position: relative;
    width: 90%;
    max-width: 1000px;
    max-height: 600px;
    display: flex;
    justify-content: center;
    margin-inline: auto;
    background: black;
}
.video-container.theater,
.video-container.full-screen{
    max-width: initial;
    width: 100%;
    max-height: 90vh;
}
.video-container.full-screen
{
    max-height: 100vh;
}

video{
    width: 100%;
}

.video-controls-container{
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    color: white;
    z-index: 100;
    opacity: 0;
    transition: opacity 150ms ease-in-out;
}

.video-controls-container::before{
    content: "";
    position: absolute;
    bottom: 0;
    background: linear-gradient(to top, rgba(0,0,0,.75), transparent);
    width: 100%;
    aspect-ratio: 6/1;
    z-index: -1;
    pointer-events: none;
}

.video-container:hover .video-controls-container,
.video-container:focus-within .video-controls-container,
.video-container.paused .video-controls-container
{
    opacity: 1;
}

.video-controls-container .controls{
    display: flex;
    gap: .5rem;
    padding: .25rem;
    align-items: center;
    flex-direction: row-reverse;
}

.video-controls-container .controls button{
    background: none;
    border: none;
    color: inherit;
    padding: 0;
    height: 30px;
    width: 30px;
    font-size: 1.1rem;
    cursor: pointer;
    opacity: .85;
    transition: opacity 150ms ease-in-out;
}
.video-controls-container .controls button:hover{
    opacity: 1;
}

.video-container.paused .pause-icon{
    display: none;
}

.video-container:not(.paused) .play-icon{
    display: none;
}

.video-container.theater .tall{
    display: none;
}

.video-container:not(.theater) .wide{
    display: none;
}

.video-container.full-screen .open{
    display: none;
}

.video-container:not(.full-screen) .close{
    display: none;
}

.volume-high-icon,
.volume-low-icon,
.volume-muted-icon{
    display: none;
}

.video-container[data-volume-level = "high"] .volume-high-icon{
    display: block;
}

.video-container[data-volume-level = "low"] .volume-low-icon{
    display: block;
}

.video-container[data-volume-level = "muted"] .volume-muted-icon{
    display: block;
}

.volume-container{
    display: flex;
    align-items: center;
}

.volume-slider{
    width: 0;
    transform-origin: right;
    transform: scaleX(0);
    transition: width 150ms ease-in-out, transform 150ms ease-in-out;
}

.volume-container:hover .volume-slider,
.volume-slider:focus-within
{
    width: 100px;
    transform: scaleX(1);
}

.duration-container{
    display: flex;
    align-items: center;
    gap: .25rem;
    flex-grow: 1;
    flex-direction: row-reverse;
}

.video-controls-container .controls button.wide-btn{
    width: 50px;
}

.timeline-container{
    height: 7px;
    margin-inline: .5rem;
    cursor: pointer;
    display: flex;
    align-items: center;
}
.timeline-container:hover .timeline,
.video-container.scrubbing .timeline{
    height: 100%;
}

.timeline{
    background: rgba(100, 100, 100, .5);
    height: 3px;
    width: 100%;
    position: relative;
}

.timeline::before{
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    right: calc(100% - var(--preview-position) * 100%);
    background-color: rgba(150, 150, 150, 1);
    display: none;
}
.timeline-container:hover .timeline::before,
.video-container.scrubbing .timeline::before{
    display: block;
}

.timeline::after{
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    right: calc(100% - var(--progress-position) * 100%);
    background-color: red;
}

.timeline .thumb-indicator{
    --scale: 0;
    position: absolute;
    transform: translateX(-50%) scale(var(--scale));
    height: 200%;
    top: -50%;
    left: calc(var(--progress-position) * 100%);
    background-color: red;
    border-radius: 50%;
    transition: transform 150ms ease-in-out;
    aspect-ratio: 1 / 1;
}
.timeline-container:hover .thumb-indicator,
.video-container.scrubbing .thumb-indicator{
    --scale: 1;
}

.timeline .preview-img{
    position: absolute;
    height: 80px;
    aspect-ratio: 16 / 9;
    top: -1rem;
    transform: translate(-50%, -100%);
    left: calc(var(--preview-position) * 100%);
    border-radius: .25rem;
    border: 2px solid white;
    display: none;
}
.timeline-container:hover .preview-img,
.video-container.scrubbing .preview-img{
    display: block;
}

.thumbnail-img{
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    display: none;
}
.video-container.scrubbing .thumbnail-img{
    display: block;
}
</style>
@endsection

@section("script")
<script>
const playPauseBtn = document.querySelector(".play-pause-btn");
const theaterBtn = document.querySelector(".theater-btn");
const fullScreenBtn = document.querySelector(".full-screen-btn");
const miniPlayerBtn = document.querySelector(".mini-player-btn");
const muteBtn = document.querySelector(".mute-btn");
const speedBtn = document.querySelector(".speed-btn");
const currentTime = document.querySelector(".current-time");
const totalTime = document.querySelector(".total-time");
const previewImg = document.querySelector(".preview-img");
const thumbnailImg = document.querySelector(".thumbnail-img");
const timelineContainer = document.querySelector(".timeline-container");
const volumeSlider = document.querySelector(".volume-slider");
const videoContainer = document.querySelector(".video-container");
const video = document.querySelector("video");


video.currentTime={{ $data["lesson_watch"] == null?0:$data["lesson_watch"]->current_time }}
document.addEventListener("keydown", (e) => {
  const tagName = document.activeElement.tagName.toLowerCase();
  if (tagName === "input") {
    return;
  }

  switch (e.key.toLowerCase()) {
    case " ":
      if (tagName === "button") {
        return;
      }
    case "k":
      togglePlay();
      break;
    case "f":
      toggleFullScreenMode();
      break;
    case "t":
      toggleTheaterMode();
      break;
    case "i":
      toggleMiniPlayerMode();
      break;
    case "m":
      toggleMute();
      break;
    case "j":
    case "arrowleft":
      skip(-5);
      break;
    case "l":
    case "arrowright":
      skip(5);
      break;
  }
});

function formatDuration(time) {
  const seconds = Math.floor(time % 60);
  const minutes = Math.floor(time / 60) % 60;
  const hours = Math.floor(time / 3600);

  if (hours === 0) {
    return `${minutes}:${leadingZeroFormatter.format(seconds)}`;
  } else {
    return `${hours}:${leadingZeroFormatter.format(
      minutes
    )}:${leadingZeroFormatter.format(seconds)}`;
  }
}

// Timeline
timelineContainer.addEventListener("mousemove", handleTimelineUpdate);
timelineContainer.addEventListener("mousedown", toggleIsScrubbing);
document.addEventListener("mouseup", (e) => {
  if (isScrubbing) toggleIsScrubbing(e);
});
document.addEventListener("mousemove", (e) => {
  if (isScrubbing) handleTimelineUpdate(e);
});

let isScrubbing = false;
let wasPaused;
function toggleIsScrubbing(e) {
  const rect = timelineContainer.getBoundingClientRect();
  const percent = Math.min(Math.max(0, e.x - rect.x), rect.width) / rect.width;
  isScrubbing = (e.buttons & 1) === 1;
  videoContainer.classList.toggle("scrubbing", isScrubbing);
  if (isScrubbing) {
    wasPaused = video.paused;
    video.pause();
  } else {
    video.currentTime = percent * video.duration;
    if (!wasPaused) video.play();
  }

  handleTimelineUpdate(e);
}

function handleTimelineUpdate(e) {
  const rect = timelineContainer.getBoundingClientRect();
  const percent = Math.min(Math.max(0, e.x - rect.x), rect.width) / rect.width;
}

// Playback Speed
speedBtn.addEventListener("click", changePlaybackSpeed);

function changePlaybackSpeed() {
  let newPlaybackRate = video.playbackRate + 0.25;
  if (newPlaybackRate > 2) newPlaybackRate = 0.25;
  video.playbackRate = newPlaybackRate;
  speedBtn.textContent = `${newPlaybackRate}x`;
}

// Duration
video.addEventListener("loadeddata", () => {
  totalTime.textContent = formatDuration(video.duration);
});

video.addEventListener("timeupdate", () => {
  currentTime.textContent = formatDuration(video.currentTime);
  const percent = video.currentTime / video.duration;
  timelineContainer.style.setProperty("--progress-position", percent);


  document.addEventListener("visibilitychange", () => {
    // use the document's hidden property to check if the current tab is active!
    if (document.hidden) {
        video.pause()
    } else {
        video.play()
    }
});


    if(Math.floor(video.currentTime) % 60 == 0){
        $.ajax({
            url: "{{ route("current_time") }}",
            type: 'GET',
            data:{
                "video_id":{{ $lesson->id }},
                "current_time":video.currentTime
            },
            success: function(data) {
                // Set the options that I want
                // swal(data["msg"]);
                console.log(data)
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    }
});

const leadingZeroFormatter = new Intl.NumberFormat(undefined, {
  minimumIntegerDigits: 2,
});


function skip(duration) {
  video.currentTime += duration;
}

// Volume
muteBtn.addEventListener("click", toggleMute);
volumeSlider.addEventListener("input", (e) => {
  video.volume = e.target.value;
  video.muted = e.target.value === 0;
});

function toggleMute() {
  video.muted = !video.muted;
}

video.addEventListener("volumechange", () => {
  volumeSlider.value = video.volume;
  let volumeLevel;
  if (video.muted || video.volume === 0) {
    volumeSlider.value = 0;
    volumeLevel = "muted";
  } else if (video.volume >= 0.5) {
    volumeLevel = "high";
  } else {
    volumeLevel = "low";
  }

  videoContainer.dataset.volumeLevel = volumeLevel;
});

// View Modes
theaterBtn.addEventListener("click", toggleTheaterMode);
fullScreenBtn.addEventListener("click", toggleFullScreenMode);
miniPlayerBtn.addEventListener("click", toggleMiniPlayerMode);

function toggleTheaterMode() {
  videoContainer.classList.toggle("theater");
}

function toggleFullScreenMode() {
  if (document.fullscreenElement == null) {
    videoContainer.requestFullscreen();
  } else {
    document.exitFullscreen();
  }
}

document.addEventListener("fullscreenchange", () => {
  videoContainer.classList.toggle("full-screen", document.fullscreenElement);
});

function toggleMiniPlayerMode() {
  if (videoContainer.classList.contains("mini-player")) {
    document.exitPictureInPicture();
  } else {
    video.requestPictureInPicture();
  }
}

video.addEventListener("enterpictureinpicture", () => {
  videoContainer.classList.add("mini-player");
});

video.addEventListener("leavepictureinpicture", () => {
  videoContainer.classList.remove("mini-player");
});

// Play/Pause
playPauseBtn.addEventListener("click", togglePlay);
video.addEventListener("click", togglePlay);

function togglePlay() {
  video.paused ? video.play() : video.pause();
}

video.addEventListener("play", () => {
  videoContainer.classList.remove("paused");
  localStorage.setItem("status_video_{{ $data["lesson_watch"] == null?0:$data["lesson_watch"]->id }}", "play");
});

video.addEventListener("pause", () => {
  videoContainer.classList.add("paused");
  localStorage.setItem("status_video_{{ $data["lesson_watch"] == null?0:$data["lesson_watch"]->id }}", "puase");
});
</script>
@endsection

@section("title_script")
<link rel="stylesheet" href="{{ asset("assets/student_assets/js/moovie.css") }}">
<!-- GFonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap" rel="stylesheet">
@endsection
