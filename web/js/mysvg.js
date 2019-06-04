
TweenMax.set('#circlePath', {
    attr: {
        r: document.querySelector('#mainCircle').getAttribute('r')
    }
})
MorphSVGPlugin.convertToPath('#circlePath');

var xmlns = "http://www.w3.org/2000/svg",
    xlinkns = "http://www.w3.org/1999/xlink",
    select = function(s) {
        return document.querySelector(s);
    },
    selectAll = function(s) {
        return document.querySelectorAll(s);
    },
    mainCircle = select('#mainCircle'),
    mainContainer = select('#mainContainer'),
    plane = select('#plane'),
    mainSVG = select('.mainSVG'),
    mainCircleRadius = Number(mainCircle.getAttribute('r')),
    //radius = mainCircleRadius,
    numDots = mainCircleRadius / 2,
    step = 360 / numDots,
    dotMin = 0,
    circlePath = select('#circlePath')

//
//mainSVG.appendChild(circlePath);
TweenMax.set('svg', {
    visibility: 'visible'
})
TweenMax.set([plane], {
    transformOrigin: '50% 50%'
})

var circleBezier = MorphSVGPlugin.pathDataToBezier(circlePath.getAttribute('d'), {
    offsetX: -19,
    offsetY: -18
})

//console.log(circlePath)
var mainTl = new TimelineMax();

function makeDots() {
    var d, angle, tl;
    for (var i = 0; i < numDots; i++) {

        d = select('#dot').cloneNode(true);
        mainContainer.appendChild(d);
        angle = step * i;
        TweenMax.set(d, {
            attr: {
                cx: (Math.cos(angle * Math.PI / 180) * mainCircleRadius) + 400,
                cy: (Math.sin(angle * Math.PI / 180) * mainCircleRadius) + 300
            }
        })

        tl = new TimelineMax({
            repeat: -1
        });
        tl
            .from(d, 0.2, {
                attr: {
                    r: dotMin
                },
                ease: Power2.easeIn
            })
            .to(d, 1.8, {
                attr: {
                    r: dotMin
                },
                ease: Power2.easeOut
            })

        mainTl.add(tl, i / (numDots / tl.duration()))
    }
    var planeTl = new TimelineMax({
        repeat: -1
    });
    planeTl.to(plane, tl.duration(), {
        bezier: {
            type: "cubic",
            values: circleBezier,
            autoRotate: true
        },
        ease: Linear.easeNone
    })
    mainTl.add(planeTl, 0.05)
}

makeDots();
mainTl.time(20);
TweenMax.to(mainContainer, 30, {
    rotation: -360,
    svgOrigin: '400 300',
    repeat: -1,
    ease: Linear.easeNone
})
mainTl.timeScale(1.6);