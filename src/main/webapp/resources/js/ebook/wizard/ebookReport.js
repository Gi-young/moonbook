const editor = new EditorJS({
    holderId: "editorBox",
    tools: {
        header: {
            class: Header,
            inlineToolbar: ['link']
        },
        list: {
            class: List,
            inlineToolbar: [
                'link',
                'bold'
            ]
        },
        embed: {
            class: Embed,
            inlineToolbar: false,
            config: {
                services: {
                    youtube: true,
                    coub: true
                }
            }
        }
    }
});

let saveBtn = document.getElementById("saveBtn");

saveBtn.addEventListener("click", () => {
    editor.save().then(outputData => {
        console.log("Article data: ", outputData);
    }).catch(error => {
        console.log("Saving failed: ", error);
    });
});