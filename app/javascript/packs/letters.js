const {Engine, Render, World, Bodies, Composites, MouseConstraint} = Matter

Matter.use("matter-wrap")

const w = window.innerWidth
const h = window.innerHeight
const dpi = window.devicePixelRatio
const section = document.querySelector('section.matter')

const engine = Engine.create()

const renderer = Render.create({
  element: section,
  engine: engine,
  options: {
    width: w,
    height: h,
    pixelRatio: dpi,
    background: '#1533A2',
    wireframes: false
  }
})

const createShape = function (x, y) {
  const randomNum = Math.random()

  if (randomNum > 0.85) {
    return Bodies.circle(x, y, 20, {
      render: {
        sprite: {
          texture: "https://res.cloudinary.com/dq61mo2kj/image/upload/v1591732929/a_ubhdwl.svg",
          xScale: 1,
          yScale: 1
        }
      }
    })
  }
    else if (randomNum > 0.7) {
        return Bodies.circle(x, y, 20, {
      render: {
        sprite: {
          texture: "https://res.cloudinary.com/dq61mo2kj/image/upload/v1591732929/b_eqoh32.svg",
          xScale: 1,
          yScale: 1
        }
      }
    })
  }

  else {
    return Bodies.circle(x, y, 20, {
      render: {
        sprite: {
          texture: "https://res.cloudinary.com/dq61mo2kj/image/upload/v1591732929/c_ytlqj1.svg",
          xScale: 1,
          yScale: 1
        }
      }
    })
  }
}

const wallOptions = {
  isStatic: true,
  render: {
    visible: false
  }
}

const ground = Bodies.rectangle(w / 2, h + 50, w + 100, 100, wallOptions)
const leftWall = Bodies.rectangle(-50, h / 2, 100, h + 100, wallOptions)
const rightWall = Bodies.rectangle(w + 50, h / 2, 100, h + 100, wallOptions)
const ceiling = Bodies.rectangle(w / 2, -50, w + 100, 100, wallOptions)

const shapes = Composites.stack(50, 50, 10, 10, 40, 40, function (x, y) {
  return createShape(x, y)
})

// const circle = Bodies.circle(w / 2, h / 2, Math.min(w / 4.5, h / 4.5), {
//   isStatic: true,
//   render: {
//     sprite: {
//       texture: "https://res.cloudinary.com/dq61mo2kj/image/upload/v1591737355/new_ubnxwu.svg",
//       xScale: 1,
//       yScale: 1
//     }
//   }
// })

const circle = Bodies.circle(w / 2.5, h / 2.1, 60, {
  isStatic: true,
  render: {
    sprite: {
      texture: "https://res.cloudinary.com/dq61mo2kj/image/upload/v1591738076/purple_pn5riq.svg",
      xScale: 1,
      yScale: 1
    }
  }
})

const circle2 = Bodies.circle(w / 1.5, h / 2.1, 60, {
  isStatic: true,
  render: {
    sprite: {
      texture: "https://res.cloudinary.com/dq61mo2kj/image/upload/v1591738224/green_v0wpbz.svg",
      xScale: 1,
      yScale: 1
    }
  }
})

const circle3 = Bodies.circle(w / 1.7, h / 1.8, 60, {
  isStatic: true,
  render: {
    sprite: {
      texture: "https://res.cloudinary.com/dq61mo2kj/image/upload/v1591738258/pink_pqdz30.svg",
      xScale: 1,
      yScale: 1
    }
  }
})



const mouse = MouseConstraint.create(engine, {
  element: section,
  constraint: {
    render: {
      visible: false
    }
   }
 })

World.add(engine.world, [
  mouse,
  shapes,
  circle,
  circle2,
  circle3,
  ground,
  ceiling,
  leftWall,
  rightWall
])

Engine.run(engine)

Render.run(renderer)


document.addEventListener("click", function (event) {
  const shape = createShape(event.pageX, event.pageY)
  World.add(engine.world, shape)
})

document.addEventListener("touchstart", function (event) {
  const shape = createShape(event.pageX, event.pageY)
  World.add(engine.world, shape)
})

// window.addEventListener('deviceorientation', function (event) {
//   engine.world.gravity = {
//     x: (event.gamma / 50),
//     y: (event.beta / 25)
//   }

//   Engine.update(engine)
// })

document.addEventListener("click", function () {
  if (typeof DeviceMotionEvent.requestPermission === 'function') {
    DeviceMotionEvent.requestPermission()
        .then(permissionState => {
          if (permissionState === 'granted') {
            window.addEventListener('deviceorientation', function (event) {
                engine.world.gravity = {
                x: (event.gamma / 50),
                y: (event.beta / 25)
              }
              Engine.update(engine)
            })
          }
        })
  }
})
