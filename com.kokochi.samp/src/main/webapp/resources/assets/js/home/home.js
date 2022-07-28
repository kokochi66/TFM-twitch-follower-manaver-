document.addEventListener("DOMContentLoaded", function(){

    let addMoreBtn = document.querySelector('#addMore');					// 더보기 버튼 및 클릭 이벤트
    let videoList = document.querySelectorAll('#services .videoList');		// 리스트 버튼 클릭 이벤트
    let refreshBtnList = document.querySelectorAll('#services .refresh-btn');
    document.querySelectorAll('#about .listBtn').forEach((elem, idx) => {
        elem.addEventListener('click',(e)=> {
            videoList.forEach(elem => {if(!elem.classList.contains('displayNone')) elem.classList.add('displayNone')})
            videoList[idx].classList.remove('displayNone')
            addMoreBtn.setAttribute("label-videoIdx", idx);
            if(idx === 1) addMoreBtn.innerText = '새로고침'
            else addMoreBtn.innerText = '더 보기'
            // 클릭한 목록 활성화
        })
    })

    let recent_video = document.querySelector('#recent_video');
    let recent_live = document.querySelector('#recent_live');
    let recent_clip = document.querySelector('#recent_clip');

    let addMoreFlage = 1;
    let initVideoFlag = [1,1,1];

    addMoreBtn.addEventListener('click', (e) => {
        if(addMoreFlage === 1 || (initVideoFlag[0] === 1 && initVideoFlag[1] === 1 && initVideoFlag[2] === 1)) {
            alert('처리중입니다.')
            return false;
        }
        addMoreFlage = 1;
        if(e.target.getAttribute('label-videoIdx') === '0') request_getMyRecentVideoNext(videoList[0].querySelector('.section-title').lastChild.lastChild.querySelector('.points').innerText);
        else if(e.target.getAttribute('label-videoIdx') === '1') {
            document.getElementById('recent_live').innerHTML = `<h2>관리목록 라이브</h2>`;
            request_getMyLiveVideo('none')
        }
        else if(e.target.getAttribute('label-videoIdx') === '2') {
            console.log('클립 데이터 더보기')
            console.log(videoList[2].querySelector('.section-title').lastChild.lastChild.querySelector('.points').innerText)
            request_getMyRecentClip(videoList[2].querySelector('.section-title').lastChild.lastChild.querySelector('.points').innerText)
        }
    })			// 더보기 버튼 클릭하기
    refreshBtnList.forEach((elem,idx) => {
        if(idx == 0) elem.addEventListener('click', request_refreshMyRecentVideoNext);
        else if(idx == 2) elem.addEventListener('click', request_refreshMyRecentClip);
    })

    function request_getMyRecentVideoNext(body) {
        // 메인 헤드 슬라이더의 데이터 값 가져오기
        recent_video.appendChild(createLoadingBox());
        ajaxAwait('/home/request/getMyRecentVideo', 'POST', body, (res) => {
            recent_video.removeChild(recent_video.querySelector('.loading'));
            try {
                addService_IconSet(JSON.parse(res), document.getElementById('recent_video'), addMoreBtn);
                addMoreFlage = 0;
                initVideoFlag[0] = 0;
            } catch(e) {
                initVideoFlag[0] = 0;
                addMoreFlage = 0;
                return e;
            }
        })
    } 			// 관리목록 다시보기 더보기 데이터 요청
    function request_getMyLiveVideo(body) {
        ajaxAwait('/home/request/getMyLiveVideo', 'POST', body, (res) => {
            // console.log('라이브 비디오 가져오기 선언')
            try {
                // console.log(JSON.parse(res))
                if(res !== 'error') addService_IconSet(JSON.parse(res), document.getElementById('recent_live'))
                addMoreFlage = 0;
                initVideoFlag[1] = 0;
            } catch(e) {
                // console.log(e)
                addMoreFlage = 0;
                initVideoFlag[1] = 0;
                return e;
            }
        })

    } 				// 관리목록 라이브 데이터 요청
    function request_getMyRecentClip(body) {
        recent_clip.appendChild(createLoadingBox());
        ajaxAwait('/home/request/getMyClipVideo', 'POST', body, (res) => {
            // console.log('라이브 비디오 가져오기 선언')
            recent_clip.removeChild(recent_clip.querySelector('.loading'));
            try {
                // console.log(JSON.parse(res))
                if(res !== 'error') addService_IconSet(JSON.parse(res), document.getElementById('recent_clip'))
                addMoreFlage = 0;
                initVideoFlag[2] = 0;
            } catch(e) {
                // console.log(e)
                addMoreFlage = 0;
                initVideoFlag[2] = 0;
                return e;
            }
        })

    } 				// 관리목록 인기클립 데이터 요청
    function addService_IconSet(data, target, last) {
        let s_row = document.createElement('div');
        s_row.className = 'row icon-set';

        for(let i=0;i<data.length;i++) {
            let s_col_box = document.createElement('div');
            s_col_box.className = 'col-lg-3 col-md-4 col-sm-6 d-flex flex-column mb-5';
            s_col_box.innerHTML = `
					<div class="icon-box" title="방송목록">
					  <a href="${data[i].url}" class="linkBox" target="_blank">
						<img alt="" src="${data[i].thumbnail_url ? data[i].thumbnail_url : default_img}" width="100%">
					  </a>
					</div>
					<div class="icon-info">
					  <div class="profile">
						<img alt="" src="${data[i].profile_image_url ? data[i].profile_image_url : default_img}" width="100%" height="100%">
					  </div>
					  <div class="title text">${data[i].title}</div>
					  <div class="name text">
                        <a href="/detail?streams=${data[i].user_id}">${data[i].user_name}</a>
                      </div>
					  <div class="created_at text">${data[i].created_at}</div>
					  <div class="user_id displayNone">${data[i].user_id}</div>
					  <div class="next_page displayNone">${data[i].nextPage}</div>
					  <div class="points displayNone">${data[i].points}</div>
					</div>
				  `;
            s_row.appendChild(s_col_box)
        }

        target.appendChild(s_row)
        // target.removeChild(target.querySelector('.loading'));
    } 		// IconSet 추가하기

    request_getMyRecentVideoNext('none');
    request_getMyLiveVideo('none')
    request_getMyRecentClip('none')

    function request_refreshMyRecentVideoNext(body) {
        ajaxAwait('/home/request/refreshMyRecentVideo', 'POST', body, (res) => {
            console.log(JSON.parse(res))
            alert('새로고침 되었습니다.');
            location.reload();
        })
    } 			// 관리목록 다시보기 더보기 데이터 새로고침 요청
    function request_refreshMyRecentClip(body) {
        ajaxAwait('/home/request/refreshMyClipVideo', 'POST', body, (res) => {
            alert('새로고침 되었습니다.');
            location.reload();
        })

    } 				// 관리목록 인기클립 데이터 새로고침 요청

});