<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사내게시판 목록조회합시다</title>
    <link rel="stylesheet" href="${root}/resources/css/companyboard/write.css">
    <script defer src="${root}/resources/js/companyboard/write.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>
</head>

<body>

<div id="wrap">

    <%@ include file="/WEB-INF/views/common/main.jsp" %>
    <div id="mainboard">
            <form action="${root}/board/post" method="post">
                <div class="main-content-list">

                    <div class="write-container">
                        <label>
                            <select class="category-btn" name="categoryNo" required>
                                <option disabled="disabled" value="">주제 선택</option>
                                <c:forEach var="vo" items="${categoryList}">
                                    <option value="${vo.categoryNo}">${vo.categoryName}</option>
                                </c:forEach>
                            </select>
                        </label>
                        <div class="write-btn">
                            <input class="btn btn-primary" type="submit" value="글쓰기">
                        </div>
                    </div>

                    <div class="write-title">
                        <input type="text" name="title" placeholder="제목을 입력해주세요 ㅎㅎ">
                    </div>
                    <hr class="horizon-line">

                    <div class="write-area">
                        <textarea id="editor" name="editordata" class="custom-toolbar">

                        </textarea>

                        <input type="text" name="content" placeholder="임시용입니다~">


                    </div>

                </div>
            </form>
        </div>
    </main>

</div>

</body>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            ClassicEditor.create(document.querySelector("#editor"), {
                toolbar: {
                    items: [
                        "undo",
                        "redo",
                        "|",
                        "bold",
                        "italic",
                        "underline",
                        "|",
                        "imageUpload",
                        "link",
                        "|",
                        "bulletedList",
                        "numberedList",
                        "indent",
                        "outdent",
                        "|",
                        "alignment",
                        "blockQuote",
                        "insertTable",
                        "mediaEmbed",
                        "undo",
                        "redo"
                    ],
                    shouldNotGroupWhenFull: true
                },
                language: "kr",
                htmlEncodeOutput: false, // 엔터를 &nbsp;로 변환하지 않음
                entities: false // 공백 문자 등의 HTML 엔티티 변환 해제
            })
                .then(editor => {
                    editor.plugins.get("FileRepository").createUploadAdapter = loader => {
                        return {
                            upload: async () => {
                                const file = await loader.file;
                                const imageUrl = await uploadImage(file);
                                return {
                                    default: imageUrl
                                };
                            }
                        };
                    };

                    function uploadImage(file) {
                        return new Promise((resolve, reject) => {
                            const formData = new FormData();
                            formData.append("file", file);

                            fetch("${root}/upload/community", {
                                method: "POST",
                                body: formData
                            })
                                .then(response => response.json())
                                .then(data => {
                                    const imageUrl = data.filePath;
                                    resolve(imageUrl);
                                })
                                .catch(error => {
                                    console.error(error);
                                    reject(error);
                                });
                        });
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        });
    </script>
</html>