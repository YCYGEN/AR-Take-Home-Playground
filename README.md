# Tribute Brand AR Playground
Project template for Unity AR Engineer Take Home assignment. 

## Setup
Project is using following Unity version and packages:

1. Unity 2022.1.0f1 with iOS build support
2. URP v13.8. 
3. ARFoundation 5.0.2

**Note:**
_This combination of versions is tested and works in regards to certain URP+ARFoundation bugs in later versions of URP, where the ARCamera is expected to render with `AfterOpaques` instead `BeforeOpaques` or `Any` option in order to show the camera feed properly._ [[Unity Forum]](https://forum.unity.com/threads/ar-foundation-pre-5-0-and-urp-background-not-rendering.1302213/)

## How to use this repo

- Clone this repo, or fork it and add it to your Github account.
- Create your own working branch.
- Feel free to adapt any of the project settings, build / platform settings, or URP related setup, in order to make it easy for you to develop the solution.
- Feel free to remove already added components/scripts from the Playground scene's game objects (like ARFoundation objects, for example AROcclusionManager etc. if you don't need it or whatever might be the reason)
- Make sure to keep a clean and readable commit history.
- When ready, push your branch and open a PR pointing to `develop`. 
- If there are any instructions or descriptions you want to add to this PR, send us an email to `dev@tribute-brand.com`. 
- If you have forked the repo, share it with us or add `IgorLipovac`(lipovacjetu@gmail.com) as a collaborator, so we can check the PR.
- PR will be reviewed and we will provide feedback through the PR or by e-mail.
- You will have the chance to present your solution in the next interview step.


You are allowed to use any available open source templates, or solutions, as long as you import it properly in the provided scene and add the link referencing the origin of the imported code. Same goes for Unity assets / packages you decide to include in the solution. We are completely aware that there's a number of ready-made resources that can help you speed up the development, so feel free to use anything provided that you are able to explain why and how it fits in this solution. 

## Assignment

Download the template project and inspect the given `Playground` scene. You will find a folder called `Models/Actor` containing 2 .fbx files, containing a humanoid avatar and each file has an animation associated to it. 

Solution should have Task A fully finished, while Task B is considered advanced. If you don't have time to develop Task B, please provide an explanation of how would you approach solving the task and keep in mind that this will be one of the conversation topics in the review, cause it's a really fun conversation starter for many other related topics.

### Task A

For this task, it will be enough to use any of the `Actor_Walking` or `Actor_HangingIdle` models. You should prepare an AR scene which will allow the user to: 
- Run the Playground app on an iPhone device supporting ARFoundation 5.0.2 (or Android should be fine, even though the project is not prepared for this so it will require more work)
- When app starts, it should detect a horizontal plane where user can place an object (use any of the provided models).
- User should then be able to manipulate the object using touch gestures:
  1. Pinch to scale the object size. Same as the classic pinch-to-zoom works on touch screen devices.
  2. Long press on the object to select it. 
  3. Long press + Drag to move the object around, while keeping the object naturally standing on a detected surface, not allowing it to float in the air or   be glued to a vertical plane. 
  4. 2 finger twist to rotate the object around its Y-axis. 

Feel free to add any kind of other game objects and scripts. For example: indicator that the object is selected, or a pointer to where the object will be placed / moved. 

![walk](https://user-images.githubusercontent.com/3727687/199511593-092ff357-27e7-4ac1-94e5-2b9d23a63254.PNG)


### Task B


For this task you will need to use both `Actor_Walking` or `Actor_HangingIdle` models provided in this template. 
Requirements for this task are:

**Part 1**
- Run the Playground app on an iPhone device supporting ARFoundation 5.0.2 (or Android should be fine, even though the project is not prepared for this so it will require more work), and after that:
- User should be able to place the `Actor` object somewhere in the scene (trivial if you already solved Task A)
- After placing the object, AR app is supposed to detect if a real person appears in the scene. Hint: use body tracking or person segmentation options included in the ARFoundation. For Android: if you don't have a specific way to detect a person, use an arbitrary game object, or any other real world detected object. 
- When a person is detected, app should trigger the walking animation and our `Actor` should walk towards the detected person / object. 
- When `Actor` reaches the proximity of a person/object, this should trigger our `Actor` to attach to the person/object and stay in `Actor_HangingIdle` state. 

**Part 2**
- Once the `Actor` is attached to some detected person/object, let's have some fun with it! Let's add a behaviour which will be triggered if the person/object is moved at a certain velocity or shaking.
- This should make our `Actor` detach from the person/object and fall on the horizontal surface below it. Hint: Perhaps it can behave like a ragdoll, and collide with the surface :) 

![HangingIdle - Attach](https://user-images.githubusercontent.com/3727687/199511676-c3965971-0013-436e-983a-063d293de2b4.PNG)


**Other**
There are some helper scripts included in the project, for example `IcyBridge.cs` and its `.swift` counterparts which serve as a template for iOS <-> Unity communication. If you find this confusing or simply not needed, feel free to delete or ignore such scripts and game objects.


## Final word

If you have any questions for us regarding the task or project setup, please send them to: `dev@tribute-brand.com` and we'll answer as soon as possible. 

If you realize solving the full assignment would take you too much time, this is completely understandable. Please provide us with the unfinished solution and send us an email explaining what is done, and what is left unfinished. Also it would be very useful for us to get your feedback, especially if you think some parts of this assignment are too complex and take too much time in general. 

Thank you for taking on this assignment and we wish you good luck! 
